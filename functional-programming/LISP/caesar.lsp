(defun encrypt (str rot)
  (let ((result ""))
    (loop for char across str
          do (if (alpha-char-p char)
                 (let* ((code (char-code char))
                        (base (if (upper-case-p char) 65 97)))
                   (setf char (code-char (+ (mod (- code base rot) 26) base)))))
          (setf result (concatenate 'string result (string char))))
    result))

(defun decrypt (str rot)
  (let ((result ""))
    (loop for char across str
          do (if (alpha-char-p char)
                 (let* ((code (char-code char))
                        (base (if (upper-case-p char) 65 97)))
                   (setf char (code-char (+ (mod (- code base rot) 26) base)))))
          (setf result (concatenate 'string result (string char))))
    result))


(defun solve (str &optional (rot-count 25))
  (let ((solutions '()))
    (dotimes (rot rot-count)
      (push (decrypt str rot) solutions))
    (nreverse solutions)))

(format t "Original: ~A~%" "Pack my box with five dozen liquor jugs... then try to explain it to the TSA.")
(format t "Encrypted: ~A~%" (encrypt "Pack my box with five dozen liquor jugs... then try to explain it to the TSA." 46))
(format t "Decrypted: ~A~%" (decrypt "Bmow yk naj iuft ruhq palqz xucgad vgse... ftqz fdk fa qjbxmuz uf fa ftq FEM." 12))
(format t "Solved: ~%")
(loop for index from 0
      for solution in (solve "Bmow yk naj iuft ruhq palqz xucgad vgse... ftqz fdk fa qjbxmuz uf fa ftq FEM." 26)
      do (format t "Rot: ~D: ~A~%" index solution))


