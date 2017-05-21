package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Dissertation;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.DissertationDAO;

public class ModifyDissertationServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ModifyDissertationServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String savePath = this.getServletContext().getRealPath(
				"/WEB-INF/upload");
		String tempPath = this.getServletContext().getRealPath("/WEB-INF/temp");
		File tmpFile = new File(tempPath);
		if (!tmpFile.exists()) {
			// 创建临时目录
			tmpFile.mkdir();
		}
		String message = "";
		Dissertation dis = new Dissertation();
		try {
			// 使用Apache文件上传组件处理文件上传步骤：
			// 1、创建一个DiskFileItemFactory工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
			factory.setSizeThreshold(1024 * 100);// 设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
			// 设置上传时生成的临时文件的保存目录
			factory.setRepository(tmpFile);
			// 2、创建一个文件上传解析器
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 监听文件上传进度
			upload.setProgressListener(new ProgressListener() {
				public void update(long pBytesRead, long pContentLength,
						int arg2) {
					//
					// System.out.println("文件大小为：" + pContentLength + ",当前已处理："
					// + pBytesRead);
					//
					// 文件大小为：14608,当前已处理：4096 文件大小为：14608,当前已处理：7367
					// 文件大小为：14608,当前已处理：11419 文件大小为：14608,当前已处理：14608
					//
				}
			});
			upload.setHeaderEncoding("UTF-8");
			// 3、判断提交上来的数据是否是上传表单的数据
			if (!ServletFileUpload.isMultipartContent(request)) {
				// 按照传统方式获取数据
				return;
			}
			// 设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是10MB
			upload.setFileSizeMax(1024 * 1024 * 10);
			// 设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为100MB
			upload.setSizeMax(1024 * 1024 * 100);
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem item : list) {
				// 如果fileitem中封装的是普通输入项的数据
				if (item.isFormField()) {
					String name = item.getFieldName();
					// 解决普通输入项的数据的中文乱码问题
					String value = item.getString("UTF-8");
					// value = new String(value.getBytes("iso8859-1"),"UTF-8");
					// String title = request.getParameter(name);
					// String keyword = request.getParameter("keyword");
					// int realm2 =
					// Integer.parseInt(request.getParameter("realm2"));
					// String field = request.getParameter("field");
					// int author =
					// Integer.parseInt(request.getParameter("no"));
					// dis.setDis_title(title);
					// dis.setDis_keyword(keyword);
					// dis.setDis_realm(realm2);
					// dis.setDis_abstract(field);
					// dis.setDis_author(author);
					// Date date=new Date();
					// dis.setDis_uptime(date);
					switch (name) {
					case "title":
						dis.setDis_title(value);
						break;
					case "keyword":
						dis.setDis_keyword(value);
						break;
					case "field":
						dis.setDis_abstract(value);
						break;
					case "no":
						dis.setDis_no(Integer.parseInt(value));
						break;
					default:
						break;
					}
				} else {// 如果fileitem中封装的是上传文件
						// 得到上传的文件名称，
					String filename = item.getName();
					if (filename == null || filename.trim().equals("")) {
						continue;
					}
					// 注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：
					// c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
					// 处理获取到的上传文件的文件名的路径部分，只保留文件名部分
					filename = filename
							.substring(filename.lastIndexOf("\\") + 1);
					// 得到上传文件的扩展名
					// String fileExtName =
					// filename.substring(filename.lastIndexOf(".") + 1);
					// 如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
					// System.out.println("上传的文件的扩展名是：" + fileExtName);
					// 获取item中的上传文件的输入流
					InputStream in = item.getInputStream();
					// 得到文件保存的名称
					String saveFilename = makeFileName(filename);
					// 得到文件的保存目录
					String realSavePath = makePath(saveFilename, savePath);
					// 创建一个文件输出流
					FileOutputStream out = new FileOutputStream(realSavePath
							+ "\\" + saveFilename);
					// 创建一个缓冲区
					byte buffer[] = new byte[1024];
					// 判断输入流中的数据是否已经读完的标识
					int len = 0;
					// 循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
					while ((len = in.read(buffer)) > 0) {
						// 使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\"
						// + filename)当中
						out.write(buffer, 0, len);
					}
					// 关闭输入流
					in.close();
					// 关闭输出流
					out.close();
					// 删除处理文件上传时生成的临时文件
					// item.delete();
					Date date = new Date();
					dis.setDis_uptime(date);
					dis.setDis_file(realSavePath + "\\" + saveFilename);
					DissertationDAO.updateDissertation(dis);
					message = "文件上传成功！";
				}
			}
		} catch (FileUploadBase.FileSizeLimitExceededException e) {
			e.printStackTrace();
			request.setAttribute("message", "单个文件超出最大值！！！");
			request.getRequestDispatcher("/message.jsp").forward(request,
					response);
			return;
		} catch (FileUploadBase.SizeLimitExceededException e) {
			e.printStackTrace();
			request.setAttribute("message", "上传文件的总的大小超出限制的最大值！！！");
			request.getRequestDispatcher("/message.jsp").forward(request,
					response);
			return;
		} catch (Exception e) {
			message = "文件上传失败！";
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute("message", message);
		response.sendRedirect("dissertation.jsp");
		
	}

	private String makePath(String filename, String savePath) {
		// TODO Auto-generated method stub
		int hashcode = filename.hashCode();
		int dir1 = hashcode & 0xf; // 0--15
		int dir2 = (hashcode & 0xf0) >> 4; // 0-15
		// 构造新的保存目录
		String dir = savePath + "\\" + dir1 + "\\" + dir2; // upload\2\3
															// upload\3\5
		// File既可以代表文件也可以代表目录
		File file = new File(dir);
		// 如果目录不存在
		if (!file.exists()) {
			// 创建目录
			file.mkdirs();
		}
		return dir;
	}

	private String makeFileName(String filename) {
		return UUID.randomUUID().toString() + "_" + filename;
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
