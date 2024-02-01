# what should the return type be?
function find(students::Array{MyStudentModel,1}; 
    sid::Int64=0, netid::String="abc123")::Union{Int64, Nothing}

    # initialize -
    student_index = nothing; # default: we don't know which student we are looking for
    number_of_students = length(students) # how many students do we have?

    # main loop -
    for i ∈ 1:number_of_students
        
        # get student from the array -
        test_student = students[i];

        # if statement: does test_student have the same sid and netid that was passed? 
        if (test_student.sid == sid && test_student.netid == netid)
            student_index = i;
        end
    end


    # return -
    return student_index
end