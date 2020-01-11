function jointstates = ik_look(pos)
jointstates(1) = ik_lookup{round(pos(1)/100),round(pos(2)/100),1}; 
jointstates(2) = ik_lookup{round(pos(1)/100),round(pos(2)/100),2};
jointstates(3) = ik_lookup{round(pos(1)/100),round(pos(2)/100),3};
end