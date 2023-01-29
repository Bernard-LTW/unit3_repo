#GUI Building Task 2 - Python
from kivymd.app import MDApp
class task2(MDApp):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
    def build(self):
        return
    def byte2bit(self):
        self.output = float("{:.2f}".format(int(self.root.ids.byte_in.text)*8))
        self.root.ids.output_label.text = f"{self.output} bits"
    def bit2byte(self):
        self.output = float("{:.2f}".format(int(self.root.ids.bit_in.text)/8))
        self.root.ids.output_label.text = f"{self.output} bytes"

hey = task2()
hey.run()
