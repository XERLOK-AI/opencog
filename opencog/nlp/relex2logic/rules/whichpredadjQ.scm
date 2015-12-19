; This rule is for which-subjects in predicate-adjective sentences, as in
; "Which book is better?"
; (AN June 2015)


(define whichpredadjQ
    (BindLink
        (VariableList
			(var-decl "$a-parse" "ParseNode")
			(var-decl "$subj" "WordInstanceNode")
			(var-decl "$predadj" "WordInstanceNode")
			(var-decl "$qVar" "WordInstanceNode")
        )
        (AndLink
            (WordInstanceLink
                (VariableNode "$subj")
                (VariableNode "$a-parse")
            )
            (WordInstanceLink
                (VariableNode "$predadj")
                (VariableNode "$a-parse")
            )
            (EvaluationLink
                (DefinedLinguisticRelationshipNode "_predadj")
                (ListLink
					(VariableNode "$subj")
					(VariableNode "$predadj")
                )
            )
			(EvaluationLink
				(DefinedLinguisticRelationshipNode "_det")
				(ListLink
 					(VariableNode "$subj")
  					(VariableNode "$qVar")
				)
			)
			(InheritanceLink
				(VariableNode "$qVar")
				(DefinedLinguisticConceptNode "which")
			)
        )
        (ExecutionOutputLink
       	    (GroundedSchemaNode "scm: pre-whichpredadjQ-rule")
       	    (ListLink
       	       (VariableNode "$subj")
       	       (VariableNode "$predadj")
            )
        )
    )
)

; This is function is not needed. It is added so as not to break the existing
; r2l pipeline.
(define (pre-whichpredadjQ-rule subj predadj)
    (whichpredadjQ-rule (cog-name (word-inst-get-lemma  subj)) (cog-name subj)
              (cog-name (word-inst-get-lemma  predadj)) (cog-name predadj)
    )
)
