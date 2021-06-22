package fpoly.java5.assignment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Service
public class ImageService {

    @Autowired
    private HttpServletRequest request;

    public String store(MultipartFile multipartFile) throws IOException {
        String destinationImage = request.getServletContext().getRealPath("/images/product");

        String fileName = multipartFile.getOriginalFilename();

        File file = new File(destinationImage+"/"+fileName);
        multipartFile.transferTo(file);
        return "images/product/"+fileName;
    }
}
