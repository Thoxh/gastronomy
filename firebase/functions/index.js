const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);


/*exports.logActivities = functions.firestore.document("/Orders/{id}").onCreate((snap, context) => {
    const id = context.params.id;
    var newOrder = snap.data();
    console.log('New Order in collection: ', newOrder);
    setTime
    admin.firestore().collection('Orders').doc(id).update({status: 2});

})*/

function updateDocYellow(id) {
    console.log("Changing Status to 1");
    admin.firestore()
    .collection('Orders')
    .doc(id)
    .update({status: 1})
    .then(() => {
        console.log("Document ID: "+id+" successfully updated!");
        setTimeout(() => updateDocRed(id), 30000);
    })
    .catch((error) => {
        console.error("Error updating document: ", error);
    });
}

function updateDocRed(id) {
    console.log("Changing Status to 2");
    admin.firestore()
    .collection('Orders')
    .doc(id)
    .update({status: 2})
    .then(() => {
        console.log("Document ID: "+id+" successfully updated!");
    })
    .catch((error) => {
        console.error("Error updating document: ", error);
    });
}

exports.updateField = functions.firestore
    .document('/Orders/{id}')
    .onCreate((snapshot, context) => {
        console.log(context.params.id);
        const id = context.params.id;
        setTimeout(() => updateDocYellow(id), 30000);
    });