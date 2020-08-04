package com.ktds.devpro.config;

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

import java.util.Properties;

public class SSHConnection {

   private final static String S_PASS_PHRASE = "mypassphrase";
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

      JSch jsch = null;

      jsch = new JSch();
      Properties config=new Properties();
      
      config.put("StrictHostKeyChecking","no");
      sesion = jsch.getSession(SSH_USER, SSH_REMOTE_SERVER, SSH_REMOTE_PORT);
      sesion.setPassword("test8080!");
      sesion.setConfig(config);
      sesion.connect(); //ssh connection established!

      //by security policy, you must connect through a fowarded port
     sesion.setPortForwardingL(LOCAl_PORT, MYSQL_REMOTE_SERVER, REMOTE_PORT);
   }
}