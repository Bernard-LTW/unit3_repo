#Login App

from kivymd.app import MDApp
from kivymd.uix.screen import MDScreen

class LoginScreen(MDScreen):
    def login(self):
        print(f"Username: {self.ids.uname.text} Password: {self.ids.pwd.text}")
        if  self.ids.uname.text == "admin" and self.ids.pwd.text == "admin":
            print("Login success")
        else:
            print("Login failed")
class RegisterScreen(MDScreen):
    def register(self):
        print(f"Username: {self.ids.uname.text} Email:{self.ids.email.text} Password: {self.ids.pwd.text}")
        uname  = self.ids.uname.text
        email = self.ids.email.text
        pwd = self.ids.pwd.text
        cpwd = self.ids.cpwd.text
        if pwd != cpwd:
            print("Passwords do not match")
            self.ids.cpwd.error = True
            self.ids.cpwd.md_bg_color = "red"





class example_login(MDApp):
    def build(self):
        return


boi = example_login()
boi.run()