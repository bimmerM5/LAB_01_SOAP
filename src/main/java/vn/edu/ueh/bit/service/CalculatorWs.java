package vn.edu.ueh.bit.service;

import jakarta.jws.WebMethod;
import jakarta.jws.WebService;

@WebService
public interface CalculatorWs {
    @WebMethod
    int add(int num1, int num2);
    @WebMethod
    int sub(int a, int b);

    @WebMethod
    int mul(int a, int b);

    @WebMethod
    double div(int a, int b);
}