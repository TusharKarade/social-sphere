import * as functions from "firebase-functions/v1";
import * as admin from "firebase-admin";

admin.initializeApp();

export const logNewPost = functions.firestore
  .document("posts/{postId}")
  .onCreate(async (snapshot, context) => {
    const postData = snapshot.data();
    if (!postData) return;

    const logEntry = {
      action: "New Post",
      postId: context.params.postId,
      username: postData.username,
      message: postData.message,
      timestamp: admin.firestore.FieldValue.serverTimestamp(),
    };

    await admin.firestore().collection("activityLogs").add(logEntry);
    console.log("New post logged:", logEntry);
  });
