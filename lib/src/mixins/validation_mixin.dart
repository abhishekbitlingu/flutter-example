class ValidationMixin {
  String validateEmail(String value) {
        if(value.length==0) {
            return 'Invalid email';
        } 
          return null;
        
}



}