import React, {useState} from 'react'

const CreateWorkOut = () => {
    const [date, setDate] = useState(undefined)
    const [workout, setWorkout] = useState({})

    return(
        <div>
            Create Work Out
        </div>
    )
}

export default CreateWorkOut