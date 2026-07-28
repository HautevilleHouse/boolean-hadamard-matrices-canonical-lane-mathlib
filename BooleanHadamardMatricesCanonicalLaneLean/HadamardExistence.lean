import BooleanHadamardMatricesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BooleanHadamardMatricesCanonicalLaneLean

structure HadamardExistencePackage (order : ℕ) where
  existsHadamard : Prop
  constructionMethod : String
  witnessMatrix : Matrix (Fin order) (Fin order) ℤ
  proof : existsHadamard

structure HadamardExistenceEvidence (order : ℕ) (H : HadamardExistencePackage order) where
  existsClosed : H.existsHadamard
  matrixIsHadamard : H.witnessMatrix * H.witnessMatrixᵀ = (order : ℤ) • 1
  matrixIsBoolean : ∀ i j, H.witnessMatrix i j = 1 ∨ H.witnessMatrix i j = -1

def HadamardExistenceClosed (order : ℕ) (H : HadamardExistencePackage order) : Prop :=
  H.existsHadamard

theorem hadamard_existence_closed_from_evidence {order : ℕ} (H : HadamardExistencePackage order)
    (E : HadamardExistenceEvidence order H) : HadamardExistenceClosed order H :=
  E.existsClosed

-- Sylvester construction for orders 2^k
noncomputable def sylvesterHadamard (k : ℕ) : Matrix (Fin (2^k)) (Fin (2^k)) ℤ :=
  match k with
  | 0 => fun _ _ => 1
  | k+1 =>
    let Hk := sylvesterHadamard k
    Matrix.fromBlocks Hk Hk Hk (-Hk)

theorem sylvesterHadamardIsHadamard (k : ℕ) :
    (sylvesterHadamard k) * (sylvesterHadamard k)ᵀ = (2^k : ℤ) • 1 :=
by
  induction' k with k ih
  · -- base case k = 0
    ext i j; simp [sylvesterHadamard]
  · -- inductive step
    let Hk := sylvesterHadamard k
    have hHk : Hk * Hkᵀ = (2^k : ℤ) • 1 := ih
    have hM : sylvesterHadamard (k+1) = Matrix.fromBlocks Hk Hk Hk (-Hk) := rfl
    have hMᵀ : (sylvesterHadamard (k+1))ᵀ = Matrix.fromBlocks (Hkᵀ) (Hkᵀ) (Hkᵀ) (-(Hkᵀ)) := by
      calc
        (sylvesterHadamard (k+1))ᵀ = (Matrix.fromBlocks Hk Hk Hk (-Hk))ᵀ := by rfl
        _ = Matrix.fromBlocks (Hkᵀ) (Hkᵀ) (Hkᵀ) ((-Hk)ᵀ) := by simp [Matrix.fromBlocks_transpose]
        _ = Matrix.fromBlocks (Hkᵀ) (Hkᵀ) (Hkᵀ) (-(Hkᵀ)) := by simp
    have htopleft : Hk * Hkᵀ + Hk * Hkᵀ = (2 : ℤ) • (Hk * Hkᵀ) := by
      simp [two_smul]
    have htopright : Hk * Hkᵀ + Hk * (-(Hkᵀ)) = 0 := by
      simp
    have hbottomleft : Hk * Hkᵀ + (-Hk) * Hkᵀ = 0 := by
      simp
    have hbottomright : Hk * Hkᵀ + (-Hk) * (-(Hkᵀ)) = (2 : ℤ) • (Hk * Hkᵀ) := by
      simp
    calc
      (sylvesterHadamard (k+1)) * (sylvesterHadamard (k+1))ᵀ
          = (Matrix.fromBlocks Hk Hk Hk (-Hk)) * (Matrix.fromBlocks (Hkᵀ) (Hkᵀ) (Hkᵀ) (-(Hkᵀ))) := by
            simp [hM, hMᵀ]
      _ = Matrix.fromBlocks
            (Hk * Hkᵀ + Hk * Hkᵀ)
            (Hk * Hkᵀ + Hk * (-(Hkᵀ)))
            (Hk * Hkᵀ + (-Hk) * Hkᵀ)
            (Hk * Hkᵀ + (-Hk) * (-(Hkᵀ))) := by
            simp [Matrix.fromBlocks_mul_fromBlocks]
      _ = Matrix.fromBlocks
            ((2 : ℤ) • (Hk * Hkᵀ))
            0
            0
            ((2 : ℤ) • (Hk * Hkᵀ)) := by
            simp [htopleft, htopright, hbottomleft, hbottomright]
      _ = Matrix.fromBlocks
            ((2 : ℤ) • ((2^k : ℤ) • 1))
            0
            0
            ((2 : ℤ) • ((2^k : ℤ) • 1)) := by simp [hHk]
      _ = Matrix.fromBlocks
            ((2^(k+1) : ℤ) • 1)
            0
            0
            ((2^(k+1) : ℤ) • 1) := by
            simp [pow_succ, smul_smul, mul_comm]
      _ = (2^(k+1) : ℤ) • (Matrix.fromBlocks (1 : Matrix (Fin (2^k)) (Fin (2^k)) ℤ) 0 0 1) := by
            simp [Matrix.fromBlocks_smul]
      _ = (2^(k+1) : ℤ) • 1 := by simp [Matrix.fromBlocks_one]

end BooleanHadamardMatricesCanonicalLaneLean
end HautevilleHouse