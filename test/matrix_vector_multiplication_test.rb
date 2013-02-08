require "matrix_vector_multiplication"

describe MatrixVectorMultiplication do
  describe "on creation" do
    before do
      @n = 10
      @m = 20
      @v = 20
      @mv = MatrixVectorMultiplication.new(@m, @n, @v)
    end

    describe "matrix" do
      it "should have a matrix" do
        @mv.matrix.wont_be_nil
      end

      it "should have a matrix of size MxN" do
        @mv.matrix.length.must_equal @m
        @mv.matrix.first.length.must_equal @n
      end

      it "should be initialized" do
        mv_l = MatrixVectorMultiplication.new(3,2,2)
        ref_matrix = [
          [1,2],
          [3,4],
          [5,6]]

        mv_l.matrix.must_equal ref_matrix

      end

    end
    describe "vector" do
      it "should have a vector" do
        @mv.vector.wont_be_nil
      end

      it "has a list of length n" do
        @mv.vector.length.must_equal @v
      end

      it "has 1..n elements with the id as value" do
        ref_vector = (1..@v).to_a
        @mv.vector.must_equal ref_vector
      end

      it "is of the type array" do
        @mv.vector.must_be_instance_of Array
      end
    end
  end
end
