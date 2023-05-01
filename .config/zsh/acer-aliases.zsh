#fh aachen

# compiler bau
# compiles file with mini-java compiler
alias mini-javac='java -jar ~/Documents/CB/Praktikum/Praktikumsunterlagen/MiniJava-Compiler/miniJavaCompiler.jar <'
alias mini-java-funProc='java -jar ~/Documents/CB/Praktikum/Praktikumsunterlagen/MiniJavaFunProc-Compiler/miniJavaFunProcCompler.jar <'
# compile and run with mini java compiler
run-miniJava(){ mini-javac $1 && java miniJavaFile}
# compiler and run with mini-java-funcPronc compiler
run-miniJavaFunProc(){ mini-java-funProc $1 && java miniJavaFunProcFile} 
# run my parser/compiler on the code in input.txt
run-parser(){  javacc javacc-config.jj && cat $2 && javac "$1.java" && java $1 < $2 }
# compile my mini-java code in input.txt, translate it to Java byte code and runs the executable result.class file, $2 is the input File
run-myJava(){run-parser $1 $2 && java result}
