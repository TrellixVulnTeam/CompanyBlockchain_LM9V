
var database = firebase.database();


var validatorid= "Y3Dga12ehJVMtfT5bZvd90jiFnQ2";
console.log("validator"+validatorid);
document.querySelector(".overlay").querySelector(".popup").querySelector(".content").querySelector("#item6").onclick = function(){
if(document.querySelector(".overlay").querySelector(".popup").querySelector("h2").textContent==="Add Company"){


database.ref("Messages/"+validatorid).set({
compname:document.getElementById("item1").value,
foundername:document.getElementById("item2").value,
regid:document.getElementById("item3").value,
emp:document.getElementById("item4").value,
message:document.getElementById("item5").value,
ethaddress:document.getElementById("item7").value,
});
window.location.href= "#";
}
};

    var message= database.ref("Messages/"+validatorid);
    message.on('value',function(snapshot){
        if(validatorid===firebase.auth().currentUser.uid){
       var para= document.createElement("p");
        var div = document.createElement("div");
        var button = document.createElement("button");
        para.setAttribute("id","para-info");
        para.innerHTML = "compID: "+snapshot.val().compname+" " + "  Founder: "+snapshot.val().foundername+
        "  Reg. ID: "+snapshot.val().regid+"  Emp. NO."+snapshot.val().emp+"  Message"+snapshot.val().message+"  "+"  ETH add."+snapshot.val().ethaddress;
        div.setAttribute("class","mini-card");
        button.setAttribute("class","inner");
        button.textContent = "Vote";
        button.setAttribute("id","vote");
        div.setAttribute("id","mini-cardid");
        div.appendChild(para);
        div.appendChild(button);
        document.getElementById("messages").appendChild(div);

}
    });
