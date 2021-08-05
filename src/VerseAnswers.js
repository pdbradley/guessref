import React from 'react';
import 'bulma/css/bulma.min.css';
import {Tile, Section, Box} from 'react-bulma-components';

const VerseAnswers = ({verse_answers}) => {
return (
    <Section>
        <Box>
            <Tile vertical>
                <Tile horizontal>
                    <Tile >
                        {verse_answers[0].label}
                    </Tile>
                    <Tile>
                        {verse_answers[1].label}
                    </Tile>
                </Tile>
                <Tile horizontal>
                    <Tile>
                        {verse_answers[2].label}
                    </Tile>
                    <Tile>
                        {verse_answers[3].label}
                    </Tile>
                </Tile>
            </Tile> 
        </Box>
    </Section>   
    // bulma 2x2 grid for the four verse answers (db-unaware)
);
};

export default VerseAnswers;