findbug -p CSC.labtrunk -p CSC.sys -fAOINPW "(((Version has CC) || (To-be-fixed has CC) || (Apply-to has CC)) && ((Found has dev-test) || (Found has development) || (Found has internal-use) || (Found has regression) || (Found has sys-test) || (Found has perf-test) || (Found has release) || (Found has usability)))" | bugval Identifier Status Severity DE-manager Headline 
