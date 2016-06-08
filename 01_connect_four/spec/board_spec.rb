require 'spec_helper'
require 'board'

describe Board do
	subject do
		Board.new()
	end
	context "after creating Board object" do
 		it "board is initialized and empty" do
 			expect(subject.board).to eql(Array.new(6) { Array.new(7,"x") })
 		end
 		it "p1 and p2 are assigned symbols" do
 			expect(subject.p1).to eql("\u26AA".encode("utf-8"))
 			expect(subject.p2).to eql("\u26AB".encode("utf-8"))
 		end
 	end
 	describe "#makeMove" do
 		it "inserts properly symbol of players" do 
 			expect(subject.makeMove(subject.p1,3)).to be_truthy
 			subject.displayBoard()
 			expect(subject.board[0][2]).to eql(subject.p1)
 			expect(subject.makeMove(subject.p2,6)).to be_truthy
 			subject.displayBoard()
 			expect(subject.board[0][5]).to eql(subject.p2)
 			expect(subject.makeMove(subject.p1,3)).to be_truthy
 			subject.displayBoard()
 			expect(subject.board[1][2]).to eql(subject.p1)
 			expect(subject.makeMove(subject.p2,3)).to be_truthy
 			subject.displayBoard()
 			expect(subject.board[2][2]).to eql(subject.p2)
 		end
 		it "does not allow to insert symbol of player outside the board" do 
 			expect(subject.makeMove(subject.p1,0)).to be_falsey
 			subject.displayBoard()
 			expect(subject.makeMove(subject.p2,8)).to be_falsey
 			subject.displayBoard()
 		end
 	end
 	describe "#victory?" do
 		it "checks proper condition for victory - columns" do 
 			expect(subject.makeMove(subject.p1,3)).to be_truthy
 			expect(subject.makeMove(subject.p2,3)).to be_truthy
 			expect(subject.makeMove(subject.p1,5)).to be_truthy 			
 			expect(subject.makeMove(subject.p2,3)).to be_truthy
 			expect(subject.makeMove(subject.p1,7)).to be_truthy
 			expect(subject.makeMove(subject.p2,3)).to be_truthy
 			expect(subject.makeMove(subject.p1,1)).to be_truthy
 			expect(subject.makeMove(subject.p2,3)).to be_truthy
 			subject.displayBoard()
 			expect(subject.victory?).to be_truthy
 		end
 		it "checks proper condition for victory - rows" do 
 			expect(subject.makeMove(subject.p1,1)).to be_truthy
 			expect(subject.makeMove(subject.p2,2)).to be_truthy
 			expect(subject.makeMove(subject.p1,1)).to be_truthy 			
 			expect(subject.makeMove(subject.p2,3)).to be_truthy
 			expect(subject.makeMove(subject.p1,7)).to be_truthy
 			expect(subject.makeMove(subject.p2,4)).to be_truthy
 			expect(subject.makeMove(subject.p1,2)).to be_truthy
 			expect(subject.makeMove(subject.p2,5)).to be_truthy
 			subject.displayBoard()
 			expect(subject.victory?).to be_truthy
 		end
 		it "checks proper condition for victory - diagonal" do 
 			expect(subject.makeMove(subject.p1,1)).to be_truthy
 			expect(subject.makeMove(subject.p2,2)).to be_truthy
 			expect(subject.makeMove(subject.p1,2)).to be_truthy 			
 			expect(subject.makeMove(subject.p2,3)).to be_truthy
 			expect(subject.makeMove(subject.p2,3)).to be_truthy
 			expect(subject.makeMove(subject.p1,3)).to be_truthy
 			expect(subject.makeMove(subject.p2,4)).to be_truthy
 			expect(subject.makeMove(subject.p2,4)).to be_truthy
 			expect(subject.makeMove(subject.p2,4)).to be_truthy
 			expect(subject.makeMove(subject.p1,4)).to be_truthy
 			subject.displayBoard()
 			expect(subject.victory?).to be_truthy
 		end
 		it "checks proper condition for victory - reverse diagonal" do 
 			expect(subject.makeMove(subject.p1,4)).to be_truthy
 			expect(subject.makeMove(subject.p2,3)).to be_truthy
 			expect(subject.makeMove(subject.p1,3)).to be_truthy 			
 			expect(subject.makeMove(subject.p2,2)).to be_truthy
 			expect(subject.makeMove(subject.p2,2)).to be_truthy
 			expect(subject.makeMove(subject.p1,2)).to be_truthy
 			expect(subject.makeMove(subject.p2,1)).to be_truthy
 			expect(subject.makeMove(subject.p2,1)).to be_truthy
 			expect(subject.makeMove(subject.p2,1)).to be_truthy
 			expect(subject.makeMove(subject.p1,1)).to be_truthy
 			subject.displayBoard()
 			expect(subject.victory?).to be_truthy
 		end
 		it "ends game if there is no moves left" do 
 			subject.board.each do |item|
 				item.map! { |element| element == "x" ? "z" : element}
 			end
 			subject.displayBoard()
 			expect(subject.victory?).to be_truthy
 		end
 	end
end