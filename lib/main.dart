import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
      ),
      
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
   int firstnum=0;
   int secondnum=0;
   String texttodisplay='';
   String res='';
   int fact=1;
   String operatortoperform='';
   String showresult='';

   find(int value){
 for(int i=2;i<=value;i++){
   fact=fact*i;
 }
 return fact;
}
  void btnclicked(String btnval){
    if(btnval=='C'){
      firstnum=0;
      secondnum=0;
      res='0'; 
      texttodisplay='';
      showresult='0';
     fact=1;

    }
    else if(btnval=='+'||btnval=="-"||btnval=='sqr'||btnval=='x'||btnval=='/'||btnval=='x!'){
      firstnum=int.parse(texttodisplay);
      operatortoperform = btnval;
       if(operatortoperform=='sqr'){
        res=(firstnum*firstnum).toString();
      }
   else if(operatortoperform=='x!'){
      res=find(firstnum).toString();
    }
    else{
      res='';
      operatortoperform = btnval;
    }}
    else if(btnval == '='){
      secondnum=int.parse(texttodisplay);
      if(operatortoperform=='+'){
        res=(firstnum+secondnum).toString();
        showresult=firstnum.toString()+operatortoperform.toString()+secondnum.toString();
      }
     
      if(operatortoperform=='-'){
        res=(firstnum-secondnum).toString();
      }
      if(operatortoperform=='x'){
        res=(firstnum*secondnum).toString();
      }
      if(operatortoperform=='/'){
        res=(firstnum~/secondnum).toString();
      }
    }
    else{
      res = int.parse(texttodisplay + btnval).toString();
    }

    setState(() {
      texttodisplay = res;
    });

  }
  Widget custombutton(String btnval) {
    return Expanded(
      child: FlatButton(
                        color: Colors.black12,
                        textColor: Colors.black,
        padding: EdgeInsets.all(35.0),
        shape:  BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.black26,width: 3)),
        
        onPressed:()=> (btnclicked(btnval)) ,
        child: Text('$btnval',style:TextStyle(color:Colors.black38,fontSize: 15.0,)),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Container(
              alignment: Alignment.bottomRight,
              child:Text('$showresult',style: TextStyle(fontSize: 30.0,color: Colors.black12),)
            ),
            Container(
              padding: EdgeInsets.only(right:10),
              alignment:Alignment.bottomRight,
              child: Text('$texttodisplay',style: TextStyle(fontSize: 60.0,color:Colors.black54),),
              
            ),
            Row(
              children:[
                custombutton('sqr'),
                SizedBox(width:10.0),
                custombutton('x!')
              ]
            ),
            SizedBox(height:10.0),
            Row(
              children: [
                SizedBox(width:10.0),
                custombutton('9',),
                SizedBox(width:10.0),
                custombutton('8'),
                SizedBox(width:10.0),
                custombutton('7'),
                SizedBox(width:10.0),
                custombutton('+'),
              ],
            ),
            SizedBox(height:10.0),
            Row(
              children: [
                 SizedBox(width:10.0),
                custombutton('6'),
                SizedBox(width:10.0),
                custombutton('5'),
                SizedBox(width:10.0),
                custombutton('4'),
                SizedBox(width:10.0),
                custombutton('-'),
              ],
            ),
            SizedBox(height:10.0),
            Row(
              children: [
                 SizedBox(width:10.0),
                custombutton('3'),
                SizedBox(width:10.0),
                custombutton('2'),
                SizedBox(width:10.0),
                custombutton('1'),
                SizedBox(width:10.0),
                custombutton('x'),
              ],
            ),
            SizedBox(height:10.0),
            Row(
              children: [
                 SizedBox(width:10.0),
                custombutton("C"),
                SizedBox(width:10.0),
                custombutton('0'),
                SizedBox(width:10.0),
                custombutton('='),
                SizedBox(width:10.0),
                custombutton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
