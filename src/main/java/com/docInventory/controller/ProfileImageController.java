package com.docInventory.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.docInventory.constants.URIConstant;

/**
 * Servlet implementation class ProfileImageController
 */
@WebServlet(URIConstant.PROFILE_IMAGE)
public class ProfileImageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String parameter = request.getParameter("text");
		// set mime type as jpg image
		response.setContentType("image/png");
		ServletOutputStream out = response.getOutputStream();

		// create image
		int width = 160;
		int height = 160;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_BYTE_INDEXED);

		// get drawing context
		Graphics2D g = (Graphics2D) image.getGraphics();
		g.setColor(Color.BLUE);
		g.fillRect(0, 0, width, height);

		// draw a string
		g.setColor(Color.white);
		g.setFont(new Font("SansSerif", Font.PLAIN, 100));
		String charValue = String.valueOf(parameter.charAt(0));

		//g.drawString(charValue, 40, 110);
		drawCenteredString(charValue, width, height, g);

		// dispose context
		g.dispose();

		// encode the image as a JPEG data stream and write the same to servlet output
		// stream
		ImageIO.write(image, "PNG", out);
		// close the stream
		out.close();
	}

	public void drawCenteredString(String s, int w, int h, Graphics g) {
		FontMetrics fm = g.getFontMetrics();
		int x = (w - fm.stringWidth(s)) / 2;
		int y = (fm.getAscent() + (h - (fm.getAscent() + fm.getDescent())) / 2);
		g.drawString(s, x, y);
	}
}
