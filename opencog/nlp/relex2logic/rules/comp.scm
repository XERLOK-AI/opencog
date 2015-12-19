; This rule constructs sentential complements that have complementizers.
; e.g. in "I know that you are a fool." this constructs the relation between "that" and "are"
; (AN June 2015)

(define comp
    (BindLink
        (VariableList
			(var-decl "$a-parse" "ParseNode")
			(var-decl "$pred" "WordInstanceNode")
			(var-decl "$comp" "WordInstanceNode")
        )
        (AndLink
            (WordInstanceLink
                (VariableNode "$pred")
                (VariableNode "$a-parse")
            )
            (WordInstanceLink
                (VariableNode "$comp")
                (VariableNode "$a-parse")
            )
            (EvaluationLink
                (DefinedLinguisticRelationshipNode "_comp")
                (ListLink
                    (VariableNode "$comp")
                    (VariableNode "$pred")
                )
            )
        )
        (ExecutionOutputLink
       	   (GroundedSchemaNode "scm: pre-comp-rule")
       	      (ListLink
       	         (VariableNode "$comp")
       	         (VariableNode "$pred")
            )
        )
    )
)

; This is function is not needed. It is added so as not to break the existing
; r2l pipeline.
(define (pre-comp-rule comp pred)
  (complement-rule (cog-name (word-inst-get-lemma comp)) (cog-name comp)
	(cog-name (word-inst-get-lemma pred)) (cog-name pred)
  )
)
