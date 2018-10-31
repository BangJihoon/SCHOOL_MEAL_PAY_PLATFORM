package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


public class Gmail extends Authenticator{
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("jihoon289@gmail.com", "bthtb1440*");
	}
}
