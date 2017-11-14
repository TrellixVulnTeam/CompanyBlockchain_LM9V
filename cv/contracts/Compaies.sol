pragma solidity ^0.4.4;
///THIS IS NOT JUST ABOUT BUILDING A DATABASE OF COMPANIES AND HAVING THEM TO BE IMMUTABLE, HERE WE FOLLOW DEMOCRACY EVEN WHEN A EMPLOYER IS BEING FIRED
//IT'S NECESSARY THAT WHEN A PERSON IS BEING FIRED HE SHOULD BE GIVEN A PROPER REASON AND IF HIS CO WORKERS THINK THAT ITS INJUSTICE TO HIM
//THEY CAN VOTE AGAINST IT AND THIS IS A DIGITAL PROOF OF EXISTANCE OF PERSON AND THERE IS NO WAY A COMPANY CAN FIRE HIM WITHOUT VALID REASON
// THIS IS JUST ONE USE CASE...WITH  THIS MECHANISM I CAN MAKE A DIFFERENT BLOCKCHAIN TO MAKE CV'S MORE TRUSTABLE BY JUST ADDING ONE MORE METHOD 
//WHENEVER A PERSON HAS DONE A INTERNSHIP IN THE COMPANY OR WORKED HERE, THE DIGITAL PROOF ALWAYS REMAINS AND THAT'S WHOLLY ENOUGH TO PROVE
//THAT HE WORKED HERE.
contract Companies{
    //the group of people who will decide to add your company to the blockchain...
    //this will be decided on the basis of a voting system carried out using external
    //app and then if there is majority the company is added. WHile adding the company
    //All the validaters must agree.
    //whereas while adding employees 
    address[] validaters;
    
    struct companies{
        //Since I don't know what uniquely identifies each address I am assuming each company
        //to have unique companyId, which can be changed later according to needs.
        uint companyId;
        bytes32 companyName;
        //Any one founder will work...just for the clarrification of the main address to add company
        bytes32 founder;
        uint numberofemp;
        uint numberofbranch;
        bool isCompActive;
        //those who decide which branch is going to get created and destroyed.
        address[] branchManagers;
        mapping(uint => Branches) branches;
        uint[] branchidIndex;
    }
    //////////////////////////////////////////////////////////////
//IT IS NOT NECESSARY THAT EVERY COMPANY HAS TO REGISTER HERE. EVERY BIG BUSINESS MAN CAN OWN ONE CONTRACT LIKE THIS SO THAT
//hE CAN KEEP TRACK OF EVERYTHING WITHOUT GOING TO THE PLACE. AND THIS CONTRACT OF THAT BUSINESSMAN CAN BE CONNECTED TO LIST 
//OF ALL THE BUSINESSMANS ACCOUNT AND THUS FORMING A HUGE DEMOCRACY..HELPINNG GOVERNMENT, COMPANIES,EMPLOYEES AND FIGHTING
//CORRUPTION. 


    //////////////////////////////////////////////////////////////
    struct Branches{
        uint branchId;
        bytes32 branchName;
        uint numemp;
        bool isActive;
        //those who recruit employees. They will have to vote in majority to employee someone.
        address[] recruiters;
        mapping(address => Employee) employees;
        address[] empidindex;
    }
    struct Employee{
        bytes32 employeeName;
        uint employeeId;
        uint empAge;
        address empaddress;
        bytes32 empPosition;
        bool isWorking;
    }
    mapping(uint => companies) companyId;
    uint[] compidindex;
    function isAvailable(address sender,address[] validater) public returns (bool){
        for(uint i=0;i<validater.length;i++){
            if(validater[i]==sender){
                return true;
            }

        }
        return false;
    }
    /////////////////////////////////
//THE NEXT METHOD CAN ONLY BE CALLED IF VALIDETRS IN THE ARRAY GIVE THE MAXIMUM VOTES
//SINCE ETH TRANSACTIONS COULD BE COSTLY, SINCE WE NEED TO VOTE SEVERAL TIMES
//I THOUGHT USING BYZANTINE FAULT TOLERANCE LIKE SYSTEM TO VOTE AND THEN CALL METHOD 
//BUT ONLY PROBLEM IS COST TO SET UP THOSE NODES.

    ////////////////////////////////
    function addCompany(uint id,bytes32 companyname,bytes32 Founder,uint empno){
        //require(isAvailable(msg.sender,validaters));
        companyId[id].companyId = id;
        companyId[id].companyName = companyname;
        companyId[id].founder = Founder;
        companyId[id].numberofemp = empno;
        compidindex.push(id);

    }
    //Returns ID's of all the companies in the contract.
    
    function change_empno(uint id,uint empno){
        companyId[id].numberofemp = empno;
    }
    /////////////////////////////////
//THE NEXT METHOD CAN ONLY BE CALLED IF MANAGERS IN THE ARRAY GIVE THE MAXIMUM VOTES
//SINCE ETH TRANSACTIONS COULD BE COSTLY, SINCE WE NEED TO VOTE SEVERAL TIMES
//I THOUGHT USING BYZANTINE FAULT TOLERANCE LIKE SYSTEM TO VOTE AND THEN CALL METHOD 
//BUT ONLY PROBLEM IS COST TO SET UP THOSE NODES.

    ////////////////////////////////
    function add_branch(uint compid,uint branch_id,bytes32 branchname,uint numemps){
        require(isAvailable(msg.sender,companyId[compid].branchManagers));
        companyId[compid].branches[branch_id].branchId = branch_id;
        companyId[compid].branches[branch_id].branchName = branchname;
        companyId[compid].branches[branch_id].numemp = numemps;
        companyId[compid].numberofbranch+=1;
        companyId[compid].branchidIndex.push(branch_id);
    }
    //Returns Branch ID's / Department ID's of a particular company
   
    /////////////////////////////////
//THE NEXT METHOD CAN ONLY BE CALLED IF RECRUIETRS IN THE ARRAY GIVE THE MAXIMUM VOTES
//SINCE ETH TRANSACTIONS COULD BE COSTLY, SINCE WE NEED TO VOTE SEVERAL TIMES
//I THOUGHT USING BYZANTINE FAULT TOLERANCE LIKE SYSTEM TO VOTE AND THEN CALL METHOD 
//BUT ONLY PROBLEM IS COST TO SET UP THOSE NODES.

    ////////////////////////////////
    function add_employee(uint compid,uint branchid,bytes32 empname,address empaddress,bytes32 emppos,uint empage){
        require(isAvailable(msg.sender,companyId[compid].branches[branchid].recruiters));
        companyId[compid].branches[branchid].employees[empaddress].employeeName = empname;
        companyId[compid].branches[branchid].employees[empaddress].empAge = empage;
        companyId[compid].branches[branchid].employees[empaddress].empaddress = empaddress;
        companyId[compid].branches[branchid].employees[empaddress].empPosition = emppos;
        companyId[compid].numberofemp+=1;
        companyId[compid].branches[branchid].numemp+=1;
        companyId[compid].branches[branchid].empidindex.push(empaddress);


    }
    //Returns the names of all the employees currently working under that branch/Department
    
    //Returns address of all the employees in that branch/Department
    function get_employee_add(uint compid,uint branchid) returns (address[]){
        return companyId[compid].branches[branchid].empidindex;
        
    }
    //Returns the postions of all the employees in that branch/Department
   
    /////////////////////////////////
//THE NEXT METHOD CAN ONLY BE CALLED IF ALL THE PEOPLE IN THE ARRAY(INCLUDING EMPLOYEES,EMPLOYERS,RECRUITERS,MANAGERS) GIVE THE MAXIMUM VOTES
//SINCE ETH TRANSACTIONS COULD BE COSTLY, SINCE WE NEED TO VOTE SEVERAL TIMES
//I THOUGHT USING BYZANTINE FAULT TOLERANCE LIKE SYSTEM TO VOTE AND THEN CALL METHOD 
//BUT ONLY PROBLEM IS COST TO SET UP THOSE NODES.

    ////////////////////////////////
    function remove_employee(uint compid,uint branchid,address empid){
        companyId[compid].branches[branchid].employees[empid].isWorking = false;
        companyId[compid].numberofemp-=1;
        companyId[compid].branches[branchid].numemp-=1;
        for(uint i=0;i<companyId[compid].branches[branchid].empidindex.length;i++){
            if(companyId[compid].branches[branchid].empidindex[i]==empid){
                delete companyId[compid].branches[branchid].empidindex[i];
                for(uint j=i;j<companyId[compid].branches[branchid].empidindex.length-1;j++){
                    companyId[compid].branches[branchid].empidindex[j]=companyId[compid].branches[branchid].empidindex[j+1];
                }
                companyId[compid].branches[branchid].empidindex.length--;
            }
        }
    }
    /////////////////////////////////
//THE NEXT METHOD CAN ONLY BE CALLED IF ALL THE PEOPLE IN THE ARRAY(INCLUDING EMPLOYEES,EMPLOYERS,RECRUITERS,MANAGERS) GIVE THE MAXIMUM VOTES
//SINCE ETH TRANSACTIONS COULD BE COSTLY, SINCE WE NEED TO VOTE SEVERAL TIMES
//I THOUGHT USING BYZANTINE FAULT TOLERANCE LIKE SYSTEM TO VOTE AND THEN CALL METHOD 
//BUT ONLY PROBLEM IS COST TO SET UP THOSE NODES.

    ////////////////////////////////
    function remove_branch(uint compid,uint branchid){
        require(isAvailable(msg.sender,companyId[compid].branchManagers));
        companyId[compid].numberofbranch-=1;
        companyId[compid].branches[branchid].isActive = false;
        for(uint i=0;i<companyId[compid].branchidIndex.length;i++){
            if(companyId[compid].branchidIndex[i]==branchid){
                delete companyId[compid].branchidIndex[i];
                for(uint j=i;j<companyId[compid].branchidIndex.length-1;j++){
                    companyId[compid].branchidIndex[j]=companyId[compid].branchidIndex[j+1];
                }
                companyId[compid].branchidIndex.length--;
            }
        }
    }
    function remove_company(uint compid){
        require(isAvailable(msg.sender,validaters));
        companyId[compid].isCompActive = false;
        for(uint i=0;i<compidindex.length;i++){
            if(compidindex[i]==compid){
                delete compidindex[i];
                for(uint j=i;j<compidindex.length-1;j++){
                    compidindex[j]=compidindex[j+1];
                }
                compidindex.length--;
            }
        }
    }
    function get_active_companies() returns(uint){
        return compidindex.length;
    }
    function get_active_b_managers(uint compid) returns(uint){
        return companyId[compid].branchidIndex.length;
    }
    function get_active_employees(uint compid,uint branchid) returns(uint){
        return companyId[compid].branches[branchid].empidindex.length;
    }
    //THis can be done only by attaining majority in voting
    function add_validaters(address validater){
        validaters.push(validater);

    }
    //Even this can only be achieved by majority voting
    function remove_validater(address validater) returns(address[]){
        for(uint i=0;i<validaters.length;i++){
            if(validaters[i]==validater){
                delete validaters[i];
                for(uint j=i;j<validaters.length-1;j++){
                    validaters[j]=validaters[j+1];
                }
                validaters.length--;

            }
        }
        return validaters;
    }
    //Everything here can be achieved only by majority voting.
    //THis mechanism leads to a democratic way of deciding what is happening in your company and what 
    //is happening in your branch , where you are working.
    function add_b_manager(uint compid,address manager){
        companyId[compid].branchManagers.push(manager);

    }
    //Even this can only be achieved by majority voting
    function remove_manager(uint compid,address manager) returns(address[]){
        for(uint i=0;i<companyId[compid].branchManagers.length;i++){
            if(companyId[compid].branchManagers[i]==manager){
                delete companyId[compid].branchManagers[i];
                for(uint j=i;j<companyId[compid].branchManagers.length-1;j++){
                    companyId[compid].branchManagers[j]=companyId[compid].branchManagers[j+1];
                }
                companyId[compid].branchManagers.length--;

            }
        }
        return companyId[compid].branchManagers;
    }
    function add_recruiter(uint compid,uint branchid,address recruiter){
        companyId[compid].branches[branchid].recruiters.push(recruiter);

    }
    //Even this can only be achieved by majority voting
    function remove_recruiter(uint compid,uint branchid,address recruiter) returns(address[]){
        for(uint i=0;i<companyId[compid].branches[branchid].recruiters.length;i++){
            if(companyId[compid].branches[branchid].recruiters[i]==recruiter){
                delete companyId[compid].branches[branchid].recruiters[i];
                for(uint j=i;j<companyId[compid].branches[branchid].recruiters.length-1;j++){
                    companyId[compid].branches[branchid].recruiters[j]=companyId[compid].branches[branchid].recruiters[j+1];
                }
                companyId[compid].branches[branchid].recruiters.length--;

            }
        }
        return companyId[compid].branches[branchid].recruiters;
    }
    
}