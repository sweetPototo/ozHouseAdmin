package com.oz.ozHouseAdmin;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oz.ozHouseAdmin.dto.ProductDTO;
import com.oz.ozHouseAdmin.dto.RequestProductDTO;
import com.oz.ozHouseAdmin.dto.CategoryDTO;
import com.oz.ozHouseAdmin.dto.MsgDTO;
import com.oz.ozHouseAdmin.dto.NoticeDTO;
import com.oz.ozHouseAdmin.service.AdminProductMapper;
import com.oz.ozHouseAdmin.service.AdminManageMapper;

@Controller
public class AdminProductController {
	
	@Autowired
	private AdminProductMapper adminproductMapper;
	
	private static final String PATH = "C:\\Users\\moonj\\Desktop\\ozHouse\\ozHouse\\src\\main\\webapp\\resources\\merchant\\imageFile";
	
	private String encodeImageToBase64(File file) throws IOException {
	    byte[] fileContent = FileUtils.readFileToByteArray(file);
	    return Base64.getEncoder().encodeToString(fileContent);
	}
	
	
	@RequestMapping("/product_admin.do")
	public String ProductAdmin(HttpServletRequest req, @RequestParam Map<String, String> params) throws IOException {
		List<ProductDTO> list = adminproductMapper.requestListProduct(params);
		int requestListCount = adminproductMapper.requestListCount(params);
		req.setAttribute("requestListProduct", list);
		req.setAttribute("requestListCount", requestListCount);
		String root = PATH + "\\" + "uploadFiles";
		req.setAttribute("product_image", root);
		for (ProductDTO product : list) {
	        File imageFile = new File(root, product.getProduct_image_change());
	        if (imageFile.exists()) {
	            String encodedImage = encodeImageToBase64(imageFile);
	            product.setEncodedImage(encodedImage); // Assume ProductDTO has a field for the encoded image
	        }
	    }
		return "admin/product/product_request";
	}

	@RequestMapping("/update_admin.do")
	public String UpdateAdmin(HttpServletRequest req, @RequestParam Map<String, String> params) throws IOException {
		String root = PATH + "\\" + "uploadFiles";
		req.setAttribute("product_image", root);
		List<ProductDTO> list = adminproductMapper.updateRequestListProduct(params);
		for (ProductDTO product : list) {
	        File imageFile = new File(root, product.getProduct_image_change());
	        if (imageFile.exists()) {
	            String encodedImage = encodeImageToBase64(imageFile);
	            product.setEncodedImage(encodedImage); // Assume ProductDTO has a field for the encoded image
	        }
	    }
		int updateRequestListCount = adminproductMapper.updateRequestListCount(params);
		req.setAttribute("updateRequestListProduct", list);
		req.setAttribute("updateRequestListCount", updateRequestListCount);
		return "admin/product/update_request";
	}
	
	@RequestMapping("/delete_admin.do")
	public String DeleteAdmin(HttpServletRequest req, @RequestParam Map<String, String> params) throws IOException {
		String root = PATH + "\\" + "uploadFiles";
		req.setAttribute("product_image", root);
		List<ProductDTO> list = adminproductMapper.deleteRequestProduct(params);
		for (ProductDTO product : list) {
	        File imageFile = new File(root, product.getProduct_image_change());
	        if (imageFile.exists()) {
	            String encodedImage = encodeImageToBase64(imageFile);
	            product.setEncodedImage(encodedImage); // Assume ProductDTO has a field for the encoded image
	        }
	    }
		int deleteRequestCount = adminproductMapper.deleteRequestCount(params);
		req.setAttribute("deleteRequestProduct", list);
		req.setAttribute("deleteRequestCount", deleteRequestCount);
		return "admin/product/delete_request";
	}
	
	@RequestMapping("/admin_fok.do")
	public String productOK(HttpServletRequest req, int product_num) {
		int res = adminproductMapper.productok(product_num);
		if (res > 0) {
			req.setAttribute("msg", "상품 등록 성공했습니다.");
			req.setAttribute("url", "product_admin.do");
		}else {
			req.setAttribute("msg", "상품 등록 실패했습니다.");
			req.setAttribute("url", "product_admin.do");
		}
		return "forward:message.jsp";
	}
	
	@RequestMapping("/admin_fre.do")
	public String productRe(HttpServletRequest req, int product_num, @ModelAttribute MsgDTO dto) {
		int res = adminproductMapper.productRe(product_num);
		dto.setProduct_approval_status("re");
		int msgRes = adminproductMapper.msgin(dto);
		if (res > 0 && msgRes>0) {
			req.setAttribute("msg", "상품 반려입니다.");
			req.setAttribute("url", "product_admin.do");
		}else {
			req.setAttribute("msg", "반려 실패했습니다.");
			req.setAttribute("url", "product_admin.do");
		}
		return "forward:message.jsp";
	}
	
	@RequestMapping("/admin_fc.do")
	public String productCancel(HttpServletRequest req, int product_num, @ModelAttribute MsgDTO dto) {
		int res = adminproductMapper.productCancel(product_num);
		dto.setProduct_approval_status("ca");
		int msgRes = adminproductMapper.msgin(dto);
		if (res > 0 && msgRes>0) {
			req.setAttribute("msg", "승인 거절 상품입니다.");
			req.setAttribute("url", "product_admin.do");
		}else {
			req.setAttribute("msg", "거절 실패했습니다.");
			req.setAttribute("url", "product_admin.do");
		}
		return "forward:message.jsp";
	}
	
	@RequestMapping("/admin_update_product.do")
	public String updateOK(HttpServletRequest req, int product_num) {
		int res = adminproductMapper.requestproductUpdate(product_num);
		if (res > 0) {
			adminproductMapper.requestok(product_num);
			adminproductMapper.reproductfcancle(product_num);
			req.setAttribute("msg", "상품 수정에 성공했습니다.");
			req.setAttribute("url", "update_admin.do");
		}else {
			req.setAttribute("msg", "상품 수정에 실패했습니다.");
			req.setAttribute("url", "update_admin.do");
		}
		return "forward:message.jsp";
	}
	
	@RequestMapping("/admin_reupdate.do")
	public String requestRe(HttpServletRequest req, int product_num, @ModelAttribute MsgDTO dto) {
		int res = adminproductMapper.requestRe(product_num);
		int msgRes = adminproductMapper.msgin(dto);
		if (res > 0 && msgRes>0) {
			req.setAttribute("msg", "승인 보류 성공했습니다.");
			req.setAttribute("url", "update_admin.do");
		}else {
			req.setAttribute("msg", "승인 보류 실패했습니다.");
			req.setAttribute("url", "update_admin.do");
		}
		return "forward:message.jsp";
	}
	
	
	@RequestMapping("/admin_cancelupdate.do")
	public String requestCancel(HttpServletRequest req, int product_num, @ModelAttribute MsgDTO dto) {
		int res = adminproductMapper.requestCancel(product_num);
		int msgRes = adminproductMapper.msgin(dto);
		if (res > 0 && msgRes>0) {
			req.setAttribute("msg", "승인 거절에 성공했습니다.");
			req.setAttribute("url", "update_admin.do");
		}else {
			req.setAttribute("msg", "승인 거절에 실패했습니다.");
			req.setAttribute("url", "update_admin.do");
		}
		return "forward:message.jsp";
	}
	
	
	@RequestMapping("/admin_request_cancle.do")
	public String requestCancle(HttpServletRequest req, int product_num) {
		int res = adminproductMapper.fcancle(product_num);
		if (res > 0) {
			adminproductMapper.deletereProduct(product_num);
			adminproductMapper.deletemsg(product_num);
			req.setAttribute("msg", "상품 삭제 성공했습니다.");
			req.setAttribute("url", "delete_admin.do");
		}else {
			req.setAttribute("msg", "상품 삭제 실패했습니다.");
			req.setAttribute("url", "delete_admin.do");
		}
		return "forward:message.jsp";
	}
	
	@RequestMapping("/admin_fcancle.do")
	public String approvalfCancle(HttpServletRequest req, int product_num) {
		int res = adminproductMapper.fcancle(product_num);
		if (res > 0) {
			req.setAttribute("msg", "상품 삭제 성공했습니다.");
			req.setAttribute("url", "cancel_admin.do");
		}else {
			req.setAttribute("msg", "상품 삭제 실패했습니다.");
			req.setAttribute("url", "cancel_admin.do");
		}
		return "forward:message.jsp";
	}
		@RequestMapping("/admin_dcancle.do")
		public String approvaldCancle(HttpServletRequest req, int product_num) {
			int res = adminproductMapper.dcancle(product_num);
			if (res > 0) {
				req.setAttribute("msg", "판매 상품 등록했습니다.");
				req.setAttribute("url", "cancel_admin.do");
			}else {
				req.setAttribute("msg", "판매 상품 등록에 실패했습니다.");
				req.setAttribute("url", "cancel_admin.do");
			}
			return "forward:message.jsp";
		}
		@RequestMapping("/admin_ucancle.do")
		public String approvaluCancle(HttpServletRequest req, int product_num) {
			int res = adminproductMapper.ucancle(product_num);
			if (res > 0) {
				req.setAttribute("msg", "판매 상품 등록했습니다.");
				req.setAttribute("url", "cancel_admin.do");
			}else {
				req.setAttribute("msg", "판매 상품 등록에 실패했습니다.");
				req.setAttribute("url", "cancel_admin.do");
			}
			return "forward:message.jsp";
		}
		
		@RequestMapping("/product_content.do")
		public String productContent(HttpServletRequest req, @RequestParam Map<String, String> map) throws IOException {
			String root = PATH + "\\" + "uploadFiles";
		       String root1 = PATH + "\\" + "uploadProFiles";
		       
		       System.out.println("product_num : " + map.get("product_num"));
		       ProductDTO dto = adminproductMapper.getProduct(map.get("product_num"));

		       req.setAttribute("getProduct", dto);

		       // ���몴�씠誘몄� �씤肄붾뵫
		       File imageFile = new File(root, dto.getProduct_image_change());
		       if (imageFile.exists()) {
		           String encodedImage = encodeImageToBase64(imageFile);
		           req.setAttribute("encodedImage", encodedImage);
		       }
		       
		       // �긽�꽭�씠誘몄� �씤肄붾뵫
		       List<String> encodedImagesPro = new ArrayList<>();
		       String[] imageProFiles = dto.getProduct_image_pro_change().split(",");
		       for (String imageFileName : imageProFiles) {
		           File imageProFile = new File(root1, imageFileName);
		           if (imageProFile.exists()) {
		               String encodedImagePro = encodeImageToBase64(imageProFile);
		               encodedImagesPro.add(encodedImagePro);
		           }
		       }
		       req.setAttribute("encodedImagesPro", encodedImagesPro);
		       
		       RequestProductDTO redto = adminproductMapper.getreProduct(map.get("product_num"));

		       if (redto != null) {
			       req.setAttribute("getreProduct", redto);

			       File imageFile2 = new File(root, redto.getProduct_image_change());
			       if (imageFile2.exists()) {
			           String encodedImage2 = encodeImageToBase64(imageFile2);
			           req.setAttribute("encodedImage2", encodedImage2);
			       	}
			       List<String> encodedImagesPro2 = new ArrayList<>();
			       String[] imageProFiles2 = redto.getProduct_image_pro_change().split(",");
			       for (String imageFileName2 : imageProFiles2) {
			           File imageProFile2 = new File(root1, imageFileName2);
			           if (imageProFile2.exists()) {
			               String encodedImagePro2 = encodeImageToBase64(imageProFile2);
			               encodedImagesPro2.add(encodedImagePro2);
			           }
			       }
			       req.setAttribute("encodedImagesPro2", encodedImagesPro2);
		       }
			return "admin/product/productManagement_content";
		}
		
		@RequestMapping("/productManagement_admin.do")
		public String productmanagement(HttpServletRequest req, @RequestParam Map<String, String> params) throws IOException {
			String root = PATH + "\\" + "uploadFiles";
			
			req.setAttribute("product_image", root);
			List<ProductDTO> list = adminproductMapper.listproduct(params);
			for (ProductDTO product : list) {
		        File imageFile = new File(root, product.getProduct_image_change());
		        if (imageFile.exists()) {
		            String encodedImage = encodeImageToBase64(imageFile);
		            product.setEncodedImage(encodedImage);
		        }
		    }
			int ListCount = adminproductMapper.ListCount(params);
			req.setAttribute("Listproduct", list);
			req.setAttribute("ListCount", ListCount);
			return "admin/product/productmanagement";
		}
		
		 @RequestMapping(value="/productManagement_admin_todays.do", method=RequestMethod.GET)
		    public String addTodaysDeal(@RequestParam Map<String, String> params, Model model) {
			 System.out.println(params.get("dealDate"));
			 System.out.println(params.get("product_num"));
			 int res = adminproductMapper.updateProductToday(params);
//			 adminproductMapper.todays(Integer.parseInt(params.get("product_num")));
		        return "redirect:/productManagement_admin.do"; 
		    }
		
//		@RequestMapping("/productManagement_admin_todays.do")
//		public String todays(HttpServletRequest req, int product_num) {
//			int res = adminproductMapper.todays(product_num);
//			if (res > 0) {
//				req.setAttribute("msg", "異붽� �릱�뒿�땲�떎.");
//
//			}else {
//				req.setAttribute("msg", "�떎�뙣 �뻽�뒿�땲�떎.");
//			}
//			req.setAttribute("url", "productManagement_admin.do");
//			return "forward:message.jsp";
//		}
		
		@RequestMapping("/productManagement_admin_todays_no.do")
		public String todays_no(HttpServletRequest req, int product_num) {
			int res = adminproductMapper.todaysno(product_num);
			if (res > 0) {
				req.setAttribute("msg", "오늘의 딜 상품 해제했습니다.");

			}else {
				req.setAttribute("msg", "오늘의 딜 상품 해제 실패했습니다.");
			}
			req.setAttribute("url", "productManagement_admin.do");
			return "forward:message.jsp";
		}


}
