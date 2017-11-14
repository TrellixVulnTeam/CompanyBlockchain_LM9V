App = {
  web3Provider: null,
  contracts: {},

  init: function() {

    return App.initWeb3();
  },

  initWeb3: function() {
    
if (typeof web3 !== 'undefined') {
  App.web3Provider = web3.currentProvider;
} else {
  
  App.web3Provider = new Web3.providers.HttpProvider('http://localhost:9545');
}
web3 = new Web3(App.web3Provider);
console.log("Web 3 initiallised");
    return App.initContract();
  },

  initContract: function() {
    $.getJSON('./cv/build/contracts/Companies.json', function(data) {
 
  var AdoptionArtifact = data;
  App.contracts.Companies = TruffleContract(AdoptionArtifact);

  App.contracts.Companies.setProvider(App.web3Provider);
console.log("App contract initialised");
 
});

    return App.bindEvents();
  },

  bindEvents: function() {
    $(document).on('click', '#vote', App.handleAdopt);
    console.log("Attach button event");
  },

 

  handleAdopt: function(event) {
    event.preventDefault();

var validatorid= "Y3Dga12ehJVMtfT5bZvd90jiFnQ2";
    var petId = parseInt($(event.target).data('id'));
var adoptionInstance;
var database = firebase.database();
$(document).on('click','#vote',function(){
var message= database.ref("Messages/"+validatorid);
    message.on('value',function(snapshot){
        if(validatorid===firebase.auth().currentUser.uid){
     
        
       web3.eth.getAccounts(function(error, accounts) {
  if (error) {
    console.log(error);
  }
//Account of validator
  var account = accounts[0];
var companyid = parseInt(snapshot.val().regid);
var founder = snapshot.val().foundername;
var compname = snapshot.val().compname;
var empno = snapshot.val().emp;
console.log("Before adding company");
  App.contracts.Companies.deployed().then(function(instance) {
    adoptionInstance = instance;

    // Execute adopt as a transaction by sending account
    console.log("We are here");
    return adoptionInstance.addCompany(companyid,compname,founder,empno, {from: account});
  }).catch(function(err) {
    console.log(err.message);
  });
});

}
    });
});


  }

};

$(function() {
  $(window).load(function() {
    App.init();
  });
});
