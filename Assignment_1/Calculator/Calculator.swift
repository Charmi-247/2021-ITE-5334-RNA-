//
//  Calculator.swift
//  Calculator
//
//  Created by user202363 on 10/4/21.
//

import Foundation

//------------String Array Declaration for Calculation------------
var WorkingString = [String]()


//-------Function to Add Number And operator to Working String Array----
func push(NumOrOp: String)
{
    WorkingString.append(NumOrOp)
}


//---------Function to Clear All Character in Working String------------
func clear()
{
    WorkingString.removeAll()
}



//------------Function to Validate the Working String-----------------
func validateWorkingString() -> Bool
{
    var IndexOfOperator = 1
    var IndexofNumber = 0
    
    //Check The Operator is on the first Position or not
    if WorkingString[0] == "+" || WorkingString[0] == "-" || WorkingString[0] == "*" || WorkingString[0] == "/"
    {
        clear()
        return false
    }
    
    
    //Check Remaining position for the Operator
    for position in 1...(WorkingString.count - 1)
    {
        
        switch WorkingString[position] {
        case "+":
            if IndexOfOperator == position-1 || IndexOfOperator == position+1
            {
                clear()
                return false
            }
            else
            {
                IndexOfOperator = position
                continue
            }
        case "-":
            if IndexOfOperator == position-1 || IndexOfOperator == position+1
            {
                clear()
                return false
            }
            else
            {
                IndexOfOperator = position
                continue
            }
        case "*":
            if IndexOfOperator == position-1 || IndexOfOperator == position+1
            {
                clear()
                return false
            }
            else
            {
                IndexOfOperator = position
                continue
            }
        case "/":
            if IndexOfOperator == position-1 || IndexOfOperator == position+1
            {
                clear()
                return false
            }
            else
            {
                IndexOfOperator = position
                continue
            }
        default:
            //If the Operator is not found Then it's a Number and set the position
            if IndexofNumber == position-1 || IndexofNumber == position+1
            {
                clear()
                return false
            }
            else
            {
                IndexofNumber = position
                continue
            }
        }
    }
    return true
}



//-----------Function to Evalute Working String----------
func calculator_brain() -> Int
{
    var Number1 = 0
    var Number2 = 0
    var Result = 0
    
    //Go though String And Calculate the Answer
    for position in 0...(WorkingString.count-1)
    {
        
        switch WorkingString[position]
        {
            case "+":
                if Number1 == 0 && Number2 == 0
                {
                    Number1 = Int(WorkingString[position-1])!
                    Number2 = Int(WorkingString[position+1])!
                    Result = Number1 + Number2
                    Number1 = Result
                }
                else
                {
                    Number2 = Int(WorkingString[position+1])!
                    Result = Number1 + Number2
                    Number1 = Result
                }
                break
            case "-":
                if Number1 == 0 && Number2 == 0
                {
                    Number1 = Int(WorkingString[position-1])!
                    Number2 = Int(WorkingString[position+1])!
                    Result = Number1 - Number2
                    Number1 = Result
                }
                else
                {
                    Number2 = Int(WorkingString[position+1])!
                    Result = Number1 - Number2
                    Number1 = Result
                }
                break
            case "*":
                if Number1 == 0 && Number2 == 0
                {
                    Number1 = Int(WorkingString[position-1])!
                    Number2 = Int(WorkingString[position+1])!
                    Result = Number1 * Number2
                    Number1 = Result
                }
                else
                {
                    Number2 = Int(WorkingString[position+1])!
                    Result = Number1 * Number2
                    Number1 = Result
                }
                break
            case "/":
                if Number1 == 0 && Number2 == 0
                {
                    Number1 = Int(WorkingString[position-1])!
                    Number2 = Int(WorkingString[position+1])!
                    Result = Number1 / Number2
                    Number1 = Result
                }
                else
                {
                    Number2 = Int(WorkingString[position+1])!
                    Result = Number1 / Number2
                    Number1 = Result
                }
                break
            default:
                break
        }
    }
    clear()
    return Result
}

