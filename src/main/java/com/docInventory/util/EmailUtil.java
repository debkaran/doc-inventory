package com.docInventory.util;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletContext;

public class EmailUtil {
	/**
	 * 
	 * @param ServletContext context
	 * @param String recipient
	 * @param String subject
	 * @param String[] physicalLocationForAttachments
	 * @param String templateFileName
	 * @param Map<String, String> params
	 */
	public static void sendMailWithTemplate(ServletContext context, String recipient, String subject, String[] physicalLocationForAttachments,
			String templateFileName, Map<String, String> params) {
		EmailUtil.sendMailWithTemplate(context, new String[] {recipient}, subject, physicalLocationForAttachments, templateFileName, params);
	}
	
	/**
	 * 
	 * @param ServletContext context
	 * @param String[] recipients
	 * @param String subject
	 * @param String[] physicalLocationForAttachments
	 * @param String templateFileName
	 * @param Map<String, String> params
	 */
	public static void sendMailWithTemplate(ServletContext context, String[] recipients, String subject, String[] physicalLocationForAttachments,
			String templateFileName, Map<String, String> params) {
		try {
			String template = EmailUtil.generateHtmlTemplate(context, templateFileName, params);
			EmailUtil.sendMail(recipients, subject, physicalLocationForAttachments, template, true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * @param String[] recipients
	 * @param String subject
	 * @param String[] physicalLocationForAttachments
	 * @param String message
	 */
	public static void sendTextMail(String[] recipients, String subject, String[] physicalLocationForAttachments,
			String message) {
		EmailUtil.sendMail(recipients, subject, physicalLocationForAttachments, message, false);
	}

	/**
	 * 
	 * @param String recipient
	 * @param String subject
	 * @param String[] physicalLocationForAttachments
	 * @param String message
	 */
	public static void sendTextMail(String recipient, String subject, String[] physicalLocationForAttachments,
			String message) {
		EmailUtil.sendMail(new String[] {recipient}, subject, physicalLocationForAttachments, message, false);
	}
	
	private static void sendMail(String[] recipients, String subject, String[] physicalLocationForAttachments, String messageBody, boolean isHtml) {
		// Sender's email ID needs to be mentioned
		String from = "noreply@docInventory.com";
		// Assuming you are sending email from through gmails smtp
		String host = "smtp.gmail.com";
		// Get system properties
		Properties properties = System.getProperties();
		// Setup mail server
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		// Get the Session object.// and pass
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("suvankarsen89@gmail.com", "todbjqgnsynkeswr");
			}
		});
		// session.setDebug(true);
		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);
			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));
			// Set To: header field of the header.
			for (String recipient : recipients) {
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			}
			// Set Subject: header field
			message.setSubject(subject);
			MimeBodyPart attachmentPart = null;
			MimeBodyPart htmlBodyPart = null;
			try {
				if (physicalLocationForAttachments != null) {
					for (String fileLocation : physicalLocationForAttachments) {
						attachmentPart = new MimeBodyPart();
						File f = new File(fileLocation);
						attachmentPart.attachFile(f);
					}
				}
				if(isHtml) {
					htmlBodyPart = new MimeBodyPart();
					htmlBodyPart.setContent(messageBody, "text/html; charset=utf-8");
				} else {
					message.setText(messageBody);
				}
				
				if(attachmentPart != null || htmlBodyPart != null) {
					Multipart multipart = new MimeMultipart();
					if(attachmentPart != null) {
						multipart.addBodyPart(attachmentPart);
					}
					if(htmlBodyPart != null) {
						multipart.addBodyPart(htmlBodyPart);
					}
					message.setContent(multipart);
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			System.out.println("sending...");
			// Send message
			Transport.send(message);
			System.out.println("Sent message successfully....");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

	private static String generateHtmlTemplate(ServletContext context, String templateFileName,
			Map<String, String> params) throws IOException {
		String template = FileReaderFromRelativeLocation
				.read("/WEB-INF/views/templates/"+templateFileName, context);
		if (params != null) {
			for (Map.Entry<String, String> entry : params.entrySet()) {
				template = template.replace("${" + entry.getKey() + "}", entry.getValue());
			}
		}
		return template;
	}
}
