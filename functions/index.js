const functions = require('firebase-functions');

const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase);
exports.pushNotification = functions.database.ref("Notifications/{pushId}")
.onWrite(event=>{
    var request = event.data.val();
    var payload = {
        notification:{
            title: request.username,
            email: request.username,
            body: request.message,
            sound: "default",

        }
    };
    admin.messaging().sendToDevice(request.token,payload)
    .then(function(response){
        console.log("Successfully sent message: ",response);
    })
    .catch(function(error){
        console.log("Error sending message: ",error);
    })
});

