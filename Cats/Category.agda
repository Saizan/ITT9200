{-# OPTIONS --type-in-type #-}
module Category where

open import Utils

record Cat : Set where
  field Obj  : Set 
        Hom  : Obj → Obj → Set
        id   : {X : Obj} → Hom X X
        comp : ∀{X Y Z} → Hom Y Z → Hom X Y → Hom X Z
        idl  : ∀{X Y}{f : Hom X Y} → comp id f ≡ f
        idr  : ∀{X Y}{f : Hom X Y} → comp f id ≡ f
        ass  : ∀{W X Y Z}{f : Hom Y Z}{g : Hom X Y}{h : Hom W X} → comp f (comp g h) ≡ comp (comp f g) h

Sets : Cat
Sets = record {
         Obj  = Set;
         Hom  = λ X Y → (X → Y) ;
         id   = λ x → x;
         comp = λ f g x → f (g x);
         idl  = refl;
         idr  = refl;
         ass  = refl}