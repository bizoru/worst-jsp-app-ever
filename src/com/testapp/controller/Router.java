package com.testapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class Router {


    private HttpServletRequest req;
    private HttpServletResponse res;

    public Router(HttpServletRequest req, HttpServletResponse res){

      this.req = req;
      this.res = res;

    }

    public void dispatch(){



    }


}
