var popupElement = document.querySelector(".overlay");
var buttonElement = document.querySelector(".button_query");
buttonElement.querySelector("#add_comp").onclick= function(){
    window.location.href='#popup1'
    popupElement.querySelector(".popup").querySelector("h2").textContent = "Add Company";
    popupElement.querySelector(".content").querySelector("#item2").style.display = 'block';
    popupElement.querySelector(".content").querySelector("#item3").style.display = 'block';
    popupElement.querySelector(".content").querySelector("#item4").style.display = 'block';

};
buttonElement.querySelector("#add_dep").onclick= function(){
    window.location.href='#popup1'
    popupElement.querySelector(".popup").querySelector("h2").textContent = "Add Department";
    popupElement.querySelector(".content").querySelector("#item2").style.display = 'block';
    popupElement.querySelector(".content").querySelector("#item3").style.display = 'block';
    popupElement.querySelector(".content").querySelector("#item4").style.display = 'block';
    popupElement.querySelector(".content").querySelector("#item1").setAttribute("placeholder","company ID");
    popupElement.querySelector(".content").querySelector("#item2").setAttribute("placeholder","Dept./Branch ID");
    popupElement.querySelector(".content").querySelector("#item3").setAttribute("placeholder","NO. of emp.");
    popupElement.querySelector(".content").querySelector("#item4").setAttribute("placeholder","Dept./Branch Name");
    popupElement.querySelector(".content").querySelector("#item7").setAttribute("placeholder","Manager ETH add.");
    popupElement.querySelector(".content").querySelector("#item6").onclick = function(){
        window.location.href = "#";

    };
    
};
buttonElement.querySelector("#add_emp").onclick= function(){
    window.location.href='#popup1'
    popupElement.querySelector(".popup").querySelector("h2").textContent = "Add Employee";
    popupElement.querySelector(".content").querySelector("#item2").style.display = 'block';
    popupElement.querySelector(".content").querySelector("#item3").style.display = 'block';
    popupElement.querySelector(".content").querySelector("#item4").style.display = 'block';
     popupElement.querySelector(".content").querySelector("#item1").setAttribute("placeholder","company ID");
    popupElement.querySelector(".content").querySelector("#item2").setAttribute("placeholder","Dept./Branch ID");
    popupElement.querySelector(".content").querySelector("#item3").setAttribute("placeholder","Employee ID");
    popupElement.querySelector(".content").querySelector("#item4").setAttribute("placeholder","Employee Name");
    popupElement.querySelector(".content").querySelector("#item7").setAttribute("placeholder","Employee ETH add.");
    popupElement.querySelector(".content").querySelector("#item6").onclick = function(){
        window.location.href = "#";

    };
    
};
document.querySelector(".button_query1").querySelector("#rem_comp").onclick = function(){
window.location.href='#popup1'
    popupElement.querySelector(".popup").querySelector("h2").textContent = "Remove Company";
     popupElement.querySelector(".content").querySelector("#item1").setAttribute("placeholder","company ID");
    popupElement.querySelector(".content").querySelector("#item2").style.display = 'none';
    popupElement.querySelector(".content").querySelector("#item3").style.display = 'none';
    popupElement.querySelector(".content").querySelector("#item4").style.display = 'none';
    popupElement.querySelector(".content").querySelector("#item7").setAttribute("placeholder","Founder ETH add.");
    popupElement.querySelector(".content").querySelector("#item6").onclick = function(){
        window.location.href = "#";

    };
};
document.querySelector(".button_query1").querySelector("#rem_dep").onclick = function(){
window.location.href='#popup1'
    popupElement.querySelector(".popup").querySelector("h2").textContent = "Remove Department";
     popupElement.querySelector(".content").querySelector("#item1").setAttribute("placeholder","company ID");
     popupElement.querySelector(".content").querySelector("#item2").style.display = 'block';
    popupElement.querySelector(".content").querySelector("#item2").setAttribute("placeholder","Dept./Branch ID");
    popupElement.querySelector(".content").querySelector("#item3").style.display = 'none';
    popupElement.querySelector(".content").querySelector("#item7").setAttribute("placeholder","Manager ETH add.");
    popupElement.querySelector(".content").querySelector("#item4").style.display = 'none';

    popupElement.querySelector(".content").querySelector("#item6").onclick = function(){
        window.location.href = "#";

    };
};
document.querySelector(".button_query1").querySelector("#rem_emp").onclick = function(){
    window.location.href='#popup1'
    popupElement.querySelector(".popup").querySelector("h2").textContent = "Remove Employee";
     popupElement.querySelector(".content").querySelector("#item1").setAttribute("placeholder","company ID");
     popupElement.querySelector(".content").querySelector("#item2").style.display = 'block';
    popupElement.querySelector(".content").querySelector("#item2").setAttribute("placeholder","Dept./Branch ID");
    popupElement.querySelector(".content").querySelector("#item3").style.display = 'block';
    popupElement.querySelector(".content").querySelector("#item3").setAttribute("placeholder","Employee ID");
    popupElement.querySelector(".content").querySelector("#item7").setAttribute("placeholder","Employee ETH add.");
    popupElement.querySelector(".content").querySelector("#item4").style.display = 'none';

    popupElement.querySelector(".content").querySelector("#item6").onclick = function(){
        window.location.href = "#";

    };

};