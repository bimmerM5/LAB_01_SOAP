package vn.edu.ueh.bit.service;

import jakarta.jws.WebMethod;
import jakarta.jws.WebService;
import vn.edu.ueh.bit.service.CalculatorWs;

@WebService
public class CalculatorWsImpl implements CalculatorWs {

    @WebMethod
    public int add(int num1, int num2) {
        return num1 + num2;
    }

    @WebMethod
    public int sub(int num1, int num2) {
        return num1 - num2;
    }

    @WebMethod
    public int mul(int num1, int num2) {
        return num1 * num2;
    }

    @WebMethod
    public double div(int num1, int num2) {
        if (num2 == 0) return 0;
        return (double) num1 / num2;
    }
}