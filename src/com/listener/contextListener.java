package com.listener;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

public class contextListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent servletContextEvent){
        System.out.println("**************context创建事件*************");
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent){
        System.out.println("**************context销毁事件*************");
        //服务器关闭时关闭数据库连接
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        Driver driver = null;
        while (drivers.hasMoreElements()) {
            try {
                driver = drivers.nextElement();
                DriverManager.deregisterDriver(driver);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        AbandonedConnectionCleanupThread.checkedShutdown();
    }
}
