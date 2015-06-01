
ZZ#{Standard,Core#"private dictionary"#"InputPrompt"} = lineno -> concatenate("\1", lastprompt = concatenate(interpreterDepth:"i", toString lineno, " : "));
needsPackage "Schubert2"
--addEndFunction ( () -> assert( integral chern A == 2734099200 ) )
--(intersectionRing point)#{Standard,AfterPrint} = identity
-- Ring#{Standard, AfterNoPrint} =
Thing#{Standard,AfterPrint} = x -> << concatenate(interpreterDepth:"o") << lineNumber << " : " << class x << endl
Thing#{Standard, Print} = x -> << concatenate(interpreterDepth:"o") << lineNumber << " = " << x << endl << flush;
--FlagBundle#{Standard,AfterPrint} = FlagBundle#{Standard,AfterNoPrint} = X -> << concatenate(interpreterDepth:"o") << lineNumber << " : " << "a flag bundle with ranks " << X.BundleRanks << endl
--AbstractSheaf#{Standard,AfterNoPrint} = 
--AbstractSheaf#{Standard,AfterPrint} = E -> (
--     << concatenate(interpreterDepth:"o") << lineNumber << " : " << "an abstract sheaf of rank " << rank E << " on " << variety E << endl
--     )
Module#{Standard,AfterPrint} = M -> (
     n := rank ambient M;
     << concatenate(interpreterDepth:"o") << lineNumber << " : "
     << ring M
     << "-module";
     if M.?generators then
     if M.?relations then << ", subquotient of " << ambient M
     else << ", submodule of " << ambient M
     else if M.?relations then << ", quotient of " << ambient M
     else if n > 0 then (
	  << ", free";
	  if not all(degrees M, d -> all(d, zero)) 
	  then << ", degrees " << if degreeLength M === 1 then flatten degrees M else degrees M;
	  );
     << endl;
     )
Matrix#{Standard,AfterPrint} = 
Matrix#{Standard,AfterNoPrint} = f -> (
     << concatenate(interpreterDepth:"o") << lineNumber << " : Matrix";
     if isFreeModule target f and isFreeModule source f
     then << " " << target f << " <--- " << source f;
     << endl;
     )


