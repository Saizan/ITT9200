{-# OPTIONS --type-in-type #-}
module CwSF.Families where

open import lib.Utils
open import lib.Category
open Cat

Fam : Set → Cat 
Fam I = record {
        Obj  = I → Set ;
        Hom  = λ P Q → ∀ i → P i → Q i;
        iden = λ _ → id;
        comp = λ f g i → f i ∘ g i;
        idl  = refl;
        idr  = refl;
        ass  = refl}