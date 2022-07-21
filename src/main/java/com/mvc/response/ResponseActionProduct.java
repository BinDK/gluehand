package com.mvc.response;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ResponseActionProduct {
    private Boolean hasError = false;
    private String message;

}
