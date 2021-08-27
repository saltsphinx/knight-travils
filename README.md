# Knights Travails
Project provided by [The Odin Project](https://www.theodinproject.com).

Project, [Knights Travails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/knights-travails)

Knights Travails is a game where you play as the knight from Chess. He moves once to the right or left, and twice either up or down. The goal of this project is to build a program that gives the user the shortest path to their desired location on the Chess board, starting from the center.

<h1>Assignment</h1>
Your task is to build a function knight_moves that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.
You can think of the board as having 2-dimensional coordinates. Your function would therefore look like:

- knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
- knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
- knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]