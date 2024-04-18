import streamlit as st
from mental_health_raqa import mh_assistant

st.title('Mental Health Assistant :broken_heart:')

# Create a text input box for the OpenAI key
openai_key = st.text_input('Enter your OpenAI Key', type='password')

query = st.text_input('Enter your query', type='default')
submit = st.button('Submit')
if submit:
    if query and openai_key:
        try:
            with st.spinner('Processing your query...'):
                response = mh_assistant(openai_key,query)
            st.write(response)
        except Exception as e:
            st.error(f'An error occurred: {e}')
    else:
        st.error('Please enter your OpenAI key and Query both!',icon="🚨")
