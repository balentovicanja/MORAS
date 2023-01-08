#2.zadatak
def _parse_macro(self):
    o = 0
    w = []
    par = []
    for line in self._file.split("\n"):
        if len(line) > 0 and line[0] == "$":
            if line == "$END":
                if len(w) == 0:
                    self._flag = False
                    self._line = o
                    self._errm = "Invalid macro"
                else:
                    self._file = self._file.replace(line, f"@WHILELOOP{w[-1]}\n0;JMP\n(END_WHILELOOP{w[-1]})", 1)
                    w.pop(-1)
                    par.pop(-1)
            else:
                s = line.replace(" ", "").split("(")
                comm = s[0][1:]
                params = s[1][:-1]
                params = params.split(",")
                #print(comm, params)
                if comm == "MV":
                    self._file = self._file.replace(line,self._mv(params[0],params[1]), 1)
                elif comm == "SWP":
                    self._file = self._file.replace(line,self._swp(params[0],params[1]), 1)
                elif comm == "SUM":
                    self._file = self._file.replace(line,self._sum(params[0], params[1], params[2]), 1)
                elif comm == "WHILE":
                    w.append(o)
                    par.append(params[0])
                    self._file = self._file.replace(line,self._while(params[0], o), 1)
                else:
                    self._flag = False
                    self._line = o
                    self._errm = "Invalid macro"
        o += 1
    
def _while(self, A, o):
    	return f"(WHILELOOP{o})\n@{A}\nD=M\n@END_WHILELOOP{o}\nD;JEQ\n"
    
def _mv(self, A, B):
        return f"@{A}\nD=M\n@{B}\nM=D"

def _swp(self, A, B):
        return f"@{A}\nD=M\n@temp\nM=D\n@{B}\nD=M\n@{A}\nM=D\n@temp\nD=M\n@{B}\nM=D\n"

def _sum(self, A, B, C):
        return f"@{A}\nD=M\n@{B}\nD=D+M\n@{C}\nM=D\n"
