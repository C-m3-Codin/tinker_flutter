import 'dart:io';

import 'dart:math';

// the code accepts a person asks if the person is a mentor or a student
// if student the role is set to 2
// if mentor the role is 1
// then ask the user for his/her field of expertise of interest depending on the selected role
// later the students and mentors are asked for their available time in 24 hour clock
// then the mentors are assigned if the time and interest match
class tinker{

int role;
String name;
List<int> time = List<int>(2);
 var Exp_Int =[];
String student;
String mentor;
var back_member;

tinker(String nam)
{
  name = nam;
}
  void addStacks(){

    if(role==1){
      print('Enter your field of expertise in \n Enter 1 to stop');
      stdout.writeln(">");
      var count = -1;
      while(true)
      {
        count++;
        
      String interest=stdin.readLineSync();
     // print("mentor");
      if(interest=="1")
      {
       // print("break entered");
        break;
      }
      //print(interest);
      Exp_Int.add(interest);

      }
       print("You're a expert in the following \n");
      for (var inter in Exp_Int)
        print('\t $inter');
    }
    else if(role==2){
      print('Enter your Fields of interest \n Enter 1 to stop');
      stdout.writeln("\t");
      var count = -1;
      while(true)
      {
        count++;
      String interest=stdin.readLineSync();
      if(interest=="1")
        break;
       // print(interest);
      
      Exp_Int.add(interest);

      }
      print("You've showed interest in the following \n");
      for (var inter in Exp_Int)
        print('\t $inter');
    }
    else{
      print("wrong choice of entry");
    }


  }
  void setMentorOrLearner(){
    while(true)
    {
    print("Enter What You are(enter 1 or 2) \n 1.Mentor \n 2.Student \n \t enter your choice");
    String inp=stdin.readLineSync();
    if(isNumeric(inp))
    {
    int choice = int.parse(inp);
    if(!(choice==1 || choice==2))
      {
        print('wroing choice');

      }
      else{
        role=choice;
        break;
      }
    }
    else{
      print("wrong choice");
    }
    }


  }
  bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
  return double.parse(s, (e) => null) != null;
}

  void setAvailableTime(){
    while(true)
    {
      print("The starting ending time must be after the starting time and time should  not more than 24 ");

    print("Enter the time youll be available from (starting time) in 24 hour format \n");
    this.time[0]=int.parse(stdin.readLineSync());
    print("Enter the time you'll be available till (ending time) in 24 hour format \n");
    this.time[1]=int.parse(stdin.readLineSync()); 
    if (this.time[1]<this.time[0] || this.time[0]>24 || this.time[0]<0 || this.time[1]>24 || this.time[1]<0 ){
      print("the info entered is  wrong");
    }
    else{
      break;
    }
    }
}

  void getMentor(String inter,List<int> time,var mento ){

      for (var i in mento)
      {
        if(i.role==1)
        {
          String na=i.name;
          // print('\tchecking match with mentor $na');
          
          for (var expertise in i.Exp_Int){
            // print('\tchecking match with mentors expertise $expertise');
            if(expertise==inter){
              if(i.time[0]<=this.time[0] && i.time[1]>this.time[1])
                {
                   this.mentor=i.name;
                   i.student=this.name;
                }
            }
          }
        }
      }
}
}
void main()
{
  //List <tinker> member;
  
  bool bol_check=true;

  int i=-0;
  print("Enter the name ");
  String nam=stdin.readLineSync();
  tinker members = new tinker(nam);
  var member=[members];
   member[0].setMentorOrLearner();
    member[0].addStacks();
   
    member[0].setAvailableTime();
  while(bol_check){

    i++;

    print("Enter the name ");
    String nam=stdin.readLineSync();
    print(nam);
    tinker members = new tinker(nam);
    
    member.add(members);
     member[i].setMentorOrLearner();
    member[i].addStacks();
    member[i].setAvailableTime();    
    print("if more people press 1 \n else prees 0 \n >");
    int nn=int.parse(stdin.readLineSync());
    if(nn==0)
    {
      break;
    }
  } 
 // member[i].show(member); 
  
  //setting mentor calling function
  for(var person  in member)
  {
    String na=person.name;
    
    if(person.role==2)
    {
      print('checking student $na');
      for(var interest in person.Exp_Int)
      {
        person.getMentor(interest, person.time,member);
        String naa=person.name;
        String men=person.mentor;
        if(men==null)
        {
          print ('no matching mentor found for $na for his/her interst in $interest');
        }
        else{
        print('$naa is being mentored by $men for $interest');
        }
      }
    }
  }
}