package stu.recruitmentweb.jobportal.security;

import org.slf4j.MDC;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class CorrelationIdFilter extends OncePerRequestFilter {

    public static final String CORRELATION_ID_HEADER = "X-Request-ID";
    public static final String MDC_REQUEST_ID_KEY = "request_id";

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {
        String requestId = request.getHeader(CORRELATION_ID_HEADER);
        if (!StringUtils.hasText(requestId)) {
            requestId = "LAB-HV01-" + UUID.randomUUID().toString().substring(0, 8);
        }

        try {
            MDC.put(MDC_REQUEST_ID_KEY, requestId);
            response.setHeader(CORRELATION_ID_HEADER, requestId);
            filterChain.doFilter(request, response);
        } finally {
            MDC.remove(MDC_REQUEST_ID_KEY);
        }
    }
}
