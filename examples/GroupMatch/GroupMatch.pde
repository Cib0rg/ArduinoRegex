#include <Regexp.h>
#include <pnew.cpp>

void setup ()
{
  Serial.begin (9600);

  // match state object
  MatchState ms;


  char* input = "+IPD,0,12:S00012100:Hello world!";
  
  char* pattern = "(%d,(?<twelve>%d%d)):(?<session>S%d+)";
  
  ms.Target (input);  // set its address
  Serial.println (input);

  ms.MatchToGroups(pattern);
  
  std::map<char*, char*>* result = ms.GetGroups();
  
    std::map<char*, char*>::iterator it1;
  
  for (it1 = result->begin(); it1 != result->end(); it1++)
  {
    Serial.print("Name: ");
    Serial.println(it1->first);
    Serial.print("Value: ");
    Serial.println(it1->second);
  }

    
}  // end of setup  

void loop () {}
