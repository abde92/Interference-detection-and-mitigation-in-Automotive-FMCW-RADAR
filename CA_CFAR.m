function cfarThreshold = CA_CFAR(FFT_data, refLength,guardLength,offset)
cfarWin=ones((refLength+guardLength)*2+1,1);
cfarWin(refLength+1:refLength+1+2*guardLength)=0;
cfarWin=cfarWin/sum(cfarWin);
noiseLevel=conv( FFT_data,cfarWin,'same');
cfarThreshold=noiseLevel+offset;
end

