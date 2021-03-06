get '/questions/:id/upvote' do
  question = Question.find(params[:id])
  if !upvoted?(question)
    upvoteRemoveDownvote(question)
  end
  if request.xhr?
    question.points.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end

get '/questions/:id/downvote' do
  question = Question.find(params[:id])
  if !downvoted?(question)
    downvoteRemoveUpvote(question)
  end
  if request.xhr?
    question.points.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end

get '/answers/:id/upvote' do
  answer = Answer.find(params[:id])
  if !upvoted?(answer)
    upvoteRemoveDownvote(answer)
  end
  redirect "/questions/#{answer.question_id}"
end

get '/answers/:id/downvote' do
  answer = Answer.find(params[:id])
  if !downvoted?(answer)
    downvoteRemoveUpvote(answer)
  end
  redirect "/questions/#{answer.question_id}"
end

get '/comments/:id/upvote' do
  comment = Comment.find(params[:id])
  if !upvoted?(comment)
    upvoteRemoveDownvote(comment)
  end
  if request.xhr?
    comment.points.to_json
  else
    redirect "/questions/#{comment.commentable.id}"
  end
end

get '/comments/:id/downvote' do
  comment = Comment.find(params[:id])
  if !downvoted?(comment)
    downvoteRemoveUpvote(comment)
  end
  redirect "/questions/#{comment.commentable.id}"
end
