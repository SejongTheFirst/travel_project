package product.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import auth.service.User;
import board.service.PermissionDeniedException;
import mvc.command.CommandHandler;
import product.service.ModifyProductService;
import product.service.ModifyRequest;
import product.service.ProductData;
import product.service.ProductNotFoundException;
import product.service.ReadProductService;
import util.FileUtil;

public class ModifyProductHandler implements CommandHandler {

    private static final String FORM_VIEW = "/WEB-INF/view/product/modifyForm.jsp";

    private ReadProductService readService = new ReadProductService();
    private ModifyProductService modifyProductService = new ModifyProductService();

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        if (req.getMethod().equalsIgnoreCase("GET")) {
            return processForm(req, res);
        } else if (req.getMethod().equalsIgnoreCase("POST")) {
            return processSubmit(req, res);
        } else {
            res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return null;
        }
    }

    private String processForm(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            String noVal = req.getParameter("no");
            int no = Integer.parseInt(noVal);

            ProductData productData = readService.getProduct(no);
            User authUser = (User) req.getSession().getAttribute("authUser");

            if (!canModify(authUser, productData)) {
                res.sendError(HttpServletResponse.SC_FORBIDDEN);
                return null;
            }

            List<String> fileNames = new ArrayList<>();
            productData.getImages().forEach(image -> fileNames.add(image.getFileName()));

            ModifyRequest modReq = new ModifyRequest(authUser.getId(), no, productData.getProduct().getPrice(),
                    productData.getProduct().getProductTitle(), productData.getContent().getProductSubTitle(),
                    fileNames, productData.getContent().getProductContent());

            req.setAttribute("modReq", modReq);
            req.setAttribute("fileNmaes", fileNames);
            return FORM_VIEW;
        } catch (ProductNotFoundException e) {
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }
    }

    private boolean canModify(User authUser, ProductData productData) {
        String writerId = productData.getProduct().getSeller().getId();
        return authUser.getId().equals(writerId);
    }

    private String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
        User authUser = (User) req.getSession().getAttribute("authUser");

        MultipartRequest multi = FileUtil.getMulti(req);
        List<String> fileNames = FileUtil.getImgUrls(multi);

        String noVal = multi.getParameter("no");
        int no = Integer.parseInt(noVal);

        ModifyRequest modReq = new ModifyRequest(authUser.getId(), no, Integer.parseInt(multi.getParameter("price")),
                multi.getParameter("title"), multi.getParameter("subtitle"), fileNames, multi.getParameter("content"));

        req.setAttribute("modReq", modReq);

        Map<String, Boolean> errors = new HashMap<>();
        req.setAttribute("errors", errors);
        modReq.validate(errors);

        if (!errors.isEmpty()) {
            return FORM_VIEW;
        }

        try {
            modifyProductService.modify(modReq);
            return "/WEB-INF/view/product/modifySuccess.jsp";
        } catch (ProductNotFoundException e) {
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        } catch (PermissionDeniedException e) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN);
            return null;
        }
    }
}
