package com.example.web;

import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import org.bson.Document;
import java.util.ArrayList;
import java.util.List;

public class UserStore {
    // Get only host, username, password from ENV; DB and collection are fixed in code
    private static final String HOST = System.getenv("MONGO_DB_HOSTNAME");
    private static final String USER = System.getenv("MONGO_DB_USERNAME");
    private static final String PASS = System.getenv("MONGO_DB_PASSWORD");
    // Hardcoded DB and collection names
    private static final String DB_NAME = "admin";
    private static final String COLLECTION_NAME = "users";

    static {
        if (HOST == null || HOST.isEmpty())
            throw new RuntimeException("Missing environment variable: MONGO_DB_HOSTNAME");
        if (USER == null || USER.isEmpty())
            throw new RuntimeException("Missing environment variable: MONGO_DB_USERNAME");
        if (PASS == null || PASS.isEmpty())
            throw new RuntimeException("Missing environment variable: MONGO_DB_PASSWORD");
    }

    // Connection string format (default port 27017, using fixed DB name)
    private static final String CONNECTION_STRING =
        "mongodb://" + USER + ":" + PASS + "@" + HOST + ":27017/" + DB_NAME;
    private static final MongoClient mongoClient = MongoClients.create(CONNECTION_STRING);
    private static final MongoDatabase db = mongoClient.getDatabase(DB_NAME);
    private static final MongoCollection<Document> users = db.getCollection(COLLECTION_NAME);

    public static void addUser(String name, String email, String password) {
        Document doc = new Document("name", name)
            .append("email", email)
            .append("password", password);
        users.insertOne(doc);
    }

    public static String[] getUser(String email) {
        Document doc = users.find(Filters.eq("email", email)).first();
        if (doc == null) return null;
        return new String[] { doc.getString("name"), doc.getString("password") };
    }

    public static boolean validate(String email, String password) {
        Document doc = users.find(
            Filters.and(
                Filters.eq("email", email),
                Filters.eq("password", password)
            )
        ).first();
        return doc != null;
    }

    // NEW: Get all users for registered_users.jsp page
    public static List<UserModel> getAllUsers() {
        List<UserModel> all = new ArrayList<>();
        for (Document doc : users.find()) {
            String name = doc.getString("name");
            String email = doc.getString("email");
            all.add(new UserModel(name, email));
        }
        return all;
    }
}
