class User {
    String username;
    String password;

    public User(String username, String password){
        this.username = username;
        this.password = password;
    }

    public boolean checkLogin(){
        if(username.equals("admin") && password.equals("123456")){
            return true;
        }
        return false;
    }
}

public class TestUser {

    public static void main(String[] args) {

        User test = new User("admin","123456");

        if(test.checkLogin()){
            System.out.println("Test Passed");
        }else{
            System.out.println("Test Failed");
        }

    }
}
