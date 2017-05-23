//Elaina Chung
//APCS2 pd3
//HW25 -- What a Racket
//2017-03-27

/*****************************************************
 * class Scheme
 * Simulates a rudimentary Scheme interpreter
 *
 * ALGORITHM for EVALUATING A SCHEME EXPRESSION:
 *
 * 1. Create a new stack.
 * 2. Push the string into the stack from the back of the string
 * 3. pop the parentheses
 * 4. If the operator is + then unload(1, _stack), - then unload(2, _stack), * then unload(3, _stack)
 * 5. In the unload method, instaniate a int and a string. 
 * 6. while pop() doesn't equal ")" add/subtract/multiply to/from result.
 * 7. if there is another operator inside, call evaluate on it
 * 8. add the result of unload to retVal and return. 
 * 
 * STACK OF CHOICE: LinkedList by me
 * b/c The runtime of the LinkedList stack seemed to be faster for when adding and deleting. 
 ******************************************************/

public class Scheme 
{

    /****************************************************** 
     * precond:  Assumes expr is a valid Scheme (prefix) expression,
     *           with whitespace separating all operators, parens, and 
     *           integer operands.
     * postcond: Returns simplified value of expression, as a String
     * eg,
     *           evaluate( "( + 4 3 )" ) -> 7
     *	         evaluate( "( + 4 ( * 2 5 ) 3 )" ) -> 17
     ******************************************************/
    public static String evaluate( String expr ) 
    {
	String retVal = "";
	String[] exprArr = expr.split("\\s+"); //split on whitespace 
	LLStack _stack = new LLStack();
	for(int i = exprArr.length - 1; i >= 0; i--){
	    _stack.push(exprArr[i]);
	}
	_stack.pop();
	if(_stack.peek().equals("+")){
	    _stack.pop();
	    retVal += unload(1, _stack);
	}
	else if(_stack.peek().equals("-")){
	    _stack.pop();
	    retVal += unload(2, _stack);
	}
	else if(_stack.peek().equals("*")){
	    _stack.pop();
	    retVal += unload(3, _stack);
	}
	else{
	    throw new IllegalStateException("Operator not recognized");
	}
	return retVal;
    }


    /****************************************************** 
     * precond:  Assumes top of input stack is a number.
     * postcond: Performs op on nums until closing paren
     *           is seen thru peek().
     *           Returns result of applying operator to
     *           sequence of operands.
     *           Ops: + is 1, - is 2, * is 3
     ******************************************************/
    public static String unload( int op, Stack<String> numbers ) 
    {
	int result = 0;
	String retStr = "";
	if(op == 1){
	    while(!numbers.peek().equals(")")){
		if(numbers.peek().equals("(")){
		    String temp = "";
		    while(!numbers.peek().equals(")")){
			temp += numbers.pop() + " ";
		    }
		    temp += numbers.pop();
		    result += Integer.parseInt(evaluate(temp));
		}
		else{
		    result += Integer.parseInt(numbers.pop());
		}
	    }
	}
	else if(op == 2){
	    result = Integer.parseInt(numbers.pop());
	    while(!numbers.peek().equals(")")){
		if(numbers.peek().equals("(")){
		    String temp = "";
		    while(!numbers.peek().equals(")")){
			temp += numbers.pop() + " ";
		    }
		    temp += numbers.pop();
		    result -= Integer.parseInt(evaluate(temp));
		}
		else{
		    result -= Integer.parseInt(numbers.pop());
		}
	    }
	}
	else if(op == 3){
	    result = Integer.parseInt(numbers.pop());
	    while(!numbers.peek().equals(")")){
	        if(numbers.peek().equals("(")){
		    String temp = "";
		    while(!numbers.peek().equals(")")){
			temp += numbers.pop() + " ";
		    }
		    temp += numbers.pop();
		    result *= Integer.parseInt(evaluate(temp));
		}
		else{
		    result *= Integer.parseInt(numbers.pop());
		}
	    }
	}
	retStr += result;
	return retStr;
    }


    /*
    //optional check-to-see-if-its-a-number helper fxn:
    public static boolean isNumber( String s ) {
        try {
	    Integer.parseInt(s);
	    return true;
	}
        catch( NumberFormatException e ) {
	    return false;
	}
    }
    */


    //main method for testing
    public static void main( String[] args ) 
    {

	String zoo1 = "( + 4 3 )";
	System.out.println(zoo1);
	System.out.println("zoo1 eval'd: " + evaluate(zoo1) );
	//...7

	String zoo2 = "( + 4 ( * 2 5 ) 3 )";
	System.out.println(zoo2);
	System.out.println("zoo2 eval'd: " + evaluate(zoo2) );
	//...17

	String zoo3 = "( + 4 ( * 2 5 ) 6 3 ( - 56 50 ) )";
	System.out.println(zoo3);
	System.out.println("zoo3 eval'd: " + evaluate(zoo3) );
	//...29

	String zoo4 = "( - 1 2 3 )";
	System.out.println(zoo4);
	System.out.println("zoo4 eval'd: " + evaluate(zoo4) );
	//...-4
	/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

    }//main

}//end class Scheme
