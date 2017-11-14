> Written with [StackEdit](https://stackedit.io/).

**Go to folder CV for the smart contract (Main part of the project)**
Democracy Inside Huge businesses
-------------------------------------------------
Imagine if you ever worked in a company and you got kicked out from there for no reason and your co-workers knew that there was no fault of yours and yet you were not given justice or you applied for a job and you knew that majority of the recruiters liked you and maybe, there was one recruiter who didn't like you and didn't want you to be there (assume he has got higher position than other recruiters), then you will want the majority to decide and not just one person. Well this smart contract doesn't actually find the majority but stores the result given by other system after computing majority. Let me explain briefly:

 - There will be a list of selected people who will be one who knows if that company exists or not through their records and company registration ID, in this contract they are called validators. (Don't know if that word exists)
 - When some other person using our web interface wants to add a company which he recently registered, he types the details and then it is sent to validators.
 - These validators will then vote and if it's a majority then that company is added to the blockchain.
 - Same goes with adding a department/branch to that company and adding employees. But to add branch there are branch managers chosen by founders and recruiters to choose employees, in turn chosen by branch managers or founders.
 <a href="http://uploads.im/gFNDU.png"><img src="http://sn.uploads.im/t/gFNDU.png" border="0" />Actually how voting works; Click on image for detailed view of image</a>
Democracy Begins Here
---------------------------------
What you read before was just to have those trust worthy people to choose more trust worthy people. That's because you can't just go and say, people of India come and vote if the company should exist or not. 
 - When employees are added they have full power to vote for other         employees being added, if they see the talent in them.
 - They even get a chance to vote when a employee is being fired.
 - They can then even choose who is a fair recruiter and can also vote for the branch manager.
 **Main reason for not choosing ethereum smart contract for voting is because it would cost more to vote.**
 **The smart contract is ready but the demo website I created just shows one feature, that is add company, due to lack of time.**
 
<a href="http://uploads.im/Xo2VH.png"><img src="http://sn.uploads.im/t/Xo2VH.png" border="0" />click on image to view clearly</a>
 Benefit for Government and CV's
---------------------------------------------
Through this government can know exactly how many companies are there and how many employees in each company and can easily manage there taxing system in this manner.
**Talking about CV,  in current CV's what is the proof that the person has worked in that company and that company is legit. With this smart contract integration you can create another smart contract which checks for validity of the company and then adds experience to your digitally saved CV and you can then send that CV to your recruiter and he can blindly trust it.** 
Run it on your Computer
------------------------------------
 - Install truffle
 

    npm install truffle

 - Run truffle develop in the command shell
   

    truffle develop

 - Compile the code from the folder where contracts folder exists
    compile
 - Migrate the code
   

    migrate

 - Go to root directory of the project and run
   

    npm install

 - start the lite-server
   

    npm run dev
Used API's / OSS
-----------------------

 - Truffle
 - Solidity
 - Meta Mask
 - Lite-Server
 - Firebase
 