function output = isHaveMat(self)
    matfile = "";
    D=dir;
    for i=1:length(D)
        
        ns=strrep(self.namespace, "/", "_");
        if length(strfind(D(i).name,ns+self.fileName+".mat"))>0
            matfile=D(i).name(1:end-4);
        end
    end
    
    if matfile==""
        output=0;
    else
        fprintf("\nFind the MAT file : "+matfile+".mat\n");
        output=1;
    end

end