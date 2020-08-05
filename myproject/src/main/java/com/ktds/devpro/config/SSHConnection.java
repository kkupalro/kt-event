package com.ktds.devpro.config;

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

import java.util.Properties;

public class SSHConnection {

   private final static int LOCAl_PORT = 3306;	//임의의 값
   private final static int REMOTE_PORT = 3306;
   private final static int SSH_REMOTE_PORT = 22;
   private final static String SSH_USER = "root";
   private final static String SSH_REMOTE_SERVER = "14.63.216.41";
   private final static String MYSQL_REMOTE_SERVER = "127.0.0.1";

   private Session sesion; //represents each ssh session

   public void closeSSH ()
   {
      sesion.disconnect();
   }
   
   public SSHConnection () throws Throwable
   {
	  System.out.println("SSH Connection class start");
      JSch jsch = null;

      jsch = new JSch();
      Properties config=new Properties();
      
      config.put("StrictHostKeyChecking","no");
      sesion = jsch.getSession(SSH_USER, SSH_REMOTE_SERVER, SSH_REMOTE_PORT);
      sesion.setPassword("test8080!");
      sesion.setConfig(config);
      sesion.connect(); //ssh connection established!
      System.out.println("세션 Connect 시도");
      //by security policy, you must connect through a fowarded port
     sesion.setPortForwardingL(3306, "127.0.0.1", 3306);
     System.out.println("setPortForwardingL 끝");
   }
}